# Define color variables for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to run test cases
run_test() {
    input_mc=$1
    expected_output=$2
    test_type=${3:-normal}  # 'normal' or 'error'

    output_ll="${input_mc%.mc}_res.ll"
    output_s="${input_mc%.mc}_res.s"
    executable="${input_mc%.mc}_res.exe"
    output_exe="${input_mc%.mc}_res.out"


    if [ "$test_type" == "normal" ]; then
        ../calclyst.native -l "$input_mc" > "$output_ll"
        llc -relocation-model=pic "$output_ll" > "$output_s"
        cc -o "$executable" "$output_s" ../stdlib.o
        ./"$executable" > "$output_exe"
    else
        ../calclyst.native -l "$input_mc" > "$output_ll" 2> "$output_exe"
    fi


    # Use diff to compare the files
    diff "$output_exe" "$expected_output" > /dev/null
    if [ $? -eq 0 ]; then
        echo -e " Result: ${GREEN}Pass${NC}"
        ((passed_tests++))
    else
        echo -e " Result: ${RED}Fail${NC}"
    fi
    ((total_tests++))
}

# Variables to count test results
passed_tests=0
total_tests=0
echo -e "${GREEN}Running tests...${NC}"

# Section 1: Testing Integer
echo -e "${YELLOW}SECTION 1: Testing Integers${NC}"
echo -e " Test 1: testing correct integer declaration"
run_test "1_test_int.mc" "1_test_int.out" "normal"
echo -e " Test 2: testing invalid integer declaration"
run_test "1_test_int_fail.mc" "1_test_int_fail.out" "error"

# Section 2: Testing Void 
echo -e "${YELLOW}SECTION 2: Testing Void${NC}"
echo -e " Test 3: testing correct void declaration"
run_test "2_test_void.mc" "2_test_void.out" "normal"
echo -e " Test 4: testing invalid void declaration"
run_test "2_test_void_fail.mc" "2_test_void_fail.out" "error"

# Section 3: Testing Float
echo -e "${YELLOW}SECTION 3: Testing Float${NC}"
echo -e " Test 5: testing correct float declaration"
run_test "3_test_float.mc" "3_test_float.out" "normal"
echo -e " Test 6: testing illegal operation: float + integer"
run_test "3_test_float_fail.mc" "3_test_float_fail.out" "error"

# Section 4: Test String
echo -e "${YELLOW}SECTION 4: Testing String${NC}"
echo -e " Test 7: testing correct string declaration and assignment"
run_test "4_test_string.mc" "4_test_string.out" "normal"
echo -e " Test 8: testing illegal string assignment"
run_test "4_test_string_fail.mc" "4_test_string_fail.out" "error"

# Section 5: Test Bool
echo -e "${YELLOW}SECTION 5: Testing Bool${NC}"
echo -e " Test 9: testing correct bool declaration and assignment"
run_test "5_test_bool.mc" "5_test_bool.out" "normal"
echo -e " Test 10: testing illegal bool assignment"
run_test "5_test_bool_fail.mc" "5_test_bool_fail.out" "error"

# Section 6: Test Char
echo -e "${YELLOW}SECTION 6: Testing Char${NC}"
echo -e " Test 11: testing correct char declaration and assignment"
run_test "6_test_char.mc" "6_test_char.out" "normal"
echo -e " Test 12: testing illegal char assignment"
run_test "6_test_char_fail.mc" "6_test_char_fail.out" "error"

# Section 7: Test Real Number
echo -e "${YELLOW}SECTION 7: Testing Real Number${NC}"
echo -e " Test 13: testing correct real number declaration and assignment"
run_test "7_test_real.mc" "7_test_real.out" "normal"
echo -e " Test 14: testing illegal real assignment"
run_test "7_test_real_fail.mc" "7_test_real_fail.out" "error"

# Section 8: Test Imaginary Number
echo -e "${YELLOW}SECTION 8: Testing Imaginary Number${NC}"
echo -e " Test 15: testing correct imaginary number declaration and assignment"
run_test "8_test_img.mc" "8_test_img.out" "normal"
echo -e " Test 16: testing illegal imaginary assignment"
run_test "8_test_img_fail.mc" "8_test_img_fail.out" "error"

# Section 9: Test Complex Number
echo -e "${YELLOW}SECTION 8: Testing Complex Number${NC}"
echo -e " Test 17: testing correct complex number declaration and assignment"
run_test "9_test_complex.mc" "9_test_complex.out" "normal"
echo -e " Test 18: testing illegal complex assignment"
run_test "9_test_complex_fail.mc" "9_test_complex_fail.out" "error"

# Section 10: Test Array
echo -e "${YELLOW}SECTION 10: Testing Array${NC}"
echo -e " Test 19: testing correct Array declaration and function"
run_test "10_test_array.mc" "10_test_array.out" "normal"
echo -e " Test 20: testing illegal complex assignment"
run_test "10_test_array_fail.mc" "10_test_array_fail.out" "error"

# Display test results
passing_rate=$((passed_tests * 100 / total_tests))
echo -e "${YELLOW}Testing report:${NC}"
echo -e "${GREEN} Tested ${total_tests} test cases, passed ${passed_tests}, passing rate ${passing_rate}%.${NC}"

# Clean up .out, .ll, .exe, .s files
echo -e "Cleaning up files..."
find . -type f -name "*res.out" -exec rm {} +
find . -type f -name "*.ll" -exec rm {} +
find . -type f -name "*.exe" -exec rm {} +
find . -type f -name "*.s" -exec rm {} +