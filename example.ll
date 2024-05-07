; ModuleID = 'Calclyst'
source_filename = "Calclyst"

@n = global i32 0
@count = global i32 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.3 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@fmt.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.7 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.8 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.10 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@fmt.11 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.12 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.13 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.14 = private unnamed_addr constant [8 x i8] c"I am If\00", align 1
@fmt.15 = private unnamed_addr constant [10 x i8] c"I am elif\00", align 1
@fmt.16 = private unnamed_addr constant [10 x i8] c"I am else\00", align 1
@fmt.17 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@fmt.18 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.19 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.20 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.21 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@fmt.22 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.23 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.24 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.25 = private unnamed_addr constant [5 x i8] c"1.0r\00", align 1
@fmt.26 = private unnamed_addr constant [5 x i8] c"2.0i\00", align 1
@fmt.27 = private unnamed_addr constant [37 x i8] c"------------------------------------\00", align 1
@fmt.28 = private unnamed_addr constant [24 x i8] c"             Array Test\00", align 1
@fmt.29 = private unnamed_addr constant [36 x i8] c"Initializing Array of list = {1, 2}\00", align 1
@fmt.30 = private unnamed_addr constant [11 x i8] c"list[0] = \00", align 1
@fmt.31 = private unnamed_addr constant [10 x i8] c"list[] = \00", align 1
@fmt.32 = private unnamed_addr constant [31 x i8] c"        Build-In Function Test\00", align 1
@fmt.33 = private unnamed_addr constant [34 x i8] c"I. Permutation Test  -> P(2, 1) =\00", align 1
@fmt.34 = private unnamed_addr constant [35 x i8] c"II. Combination Test  -> C(2, 1) =\00", align 1
@fmt.35 = private unnamed_addr constant [35 x i8] c"III. Power Test -> Power(1.5, 2) =\00", align 1
@fmt.36 = private unnamed_addr constant [55 x i8] c"IV. Bionomial Prob Test -> P(n = 2, p = 0.5, r = 2): =\00", align 1
@fmt.37 = private unnamed_addr constant [27 x i8] c"Complex Number Calculation\00", align 1
@fmt.38 = private unnamed_addr constant [5 x i8] c"p = \00", align 1
@fmt.39 = private unnamed_addr constant [9 x i8] c"p + p = \00", align 1
@addString = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@fmt.40 = private unnamed_addr constant [9 x i8] c"p - p = \00", align 1
@addString.41 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString.42 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString.43 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString.44 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@fmt.45 = private unnamed_addr constant [9 x i8] c"p * p = \00", align 1
@addString.46 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString.47 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString.48 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString.49 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@fmt.50 = private unnamed_addr constant [9 x i8] c"p / p = \00", align 1
@addString.51 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString.52 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString.53 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString.54 = private unnamed_addr constant [4 x i8] c"Div\00", align 1

declare i32 @printf(i8*, ...)

declare i8* @sconcat(i8*, i8*)

declare i8* @compose(i8*, i8*)

declare i8* @computeReal(i8*, i8*, i8*)

declare i8* @computeImaginary(i8*, i8*, i8*)

declare i8* @computeComplex(i8*, i8*, i8*)

declare i32 @permutation(i32, i32)

declare i32 @combination(i32, i32)

declare i32 @factorial(i32)

declare i32 @fibonacci(i32)

declare double @power(double, i32)

declare double @binomial_probability(i32, i32, double)

define i32 @gcd(i32 %a, i32 %b) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %b2 = alloca i32
  store i32 %b, i32* %b2
  br label %while

while:                                            ; preds = %if_end, %entry
  %a3 = load i32, i32* %a1
  %b4 = load i32, i32* %b2
  %tmp = icmp ne i32 %a3, %b4
  br i1 %tmp, label %while_body, label %while_end

while_body:                                       ; preds = %while
  %a5 = load i32, i32* %a1
  %tmp6 = add i32 %a5, 3
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %tmp6)
  %b7 = load i32, i32* %b2
  %a8 = load i32, i32* %a1
  %tmp9 = icmp slt i32 %b7, %a8
  br i1 %tmp9, label %then, label %else

then:                                             ; preds = %while_body
  %a10 = load i32, i32* %a1
  %b11 = load i32, i32* %b2
  %tmp12 = sub i32 %a10, %b11
  store i32 %tmp12, i32* %a1
  br label %if_end

else:                                             ; preds = %while_body
  %b13 = load i32, i32* %b2
  %a14 = load i32, i32* %a1
  %tmp15 = sub i32 %b13, %a14
  store i32 %tmp15, i32* %b2
  br label %if_end

if_end:                                           ; preds = %else, %then
  %a16 = load i32, i32* %a1
  %tmp17 = add i32 %a16, 1
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %tmp17)
  br label %while

while_end:                                        ; preds = %while
  %a19 = load i32, i32* %a1
  ret i32 %a19
}

define i8* @elseif(i32 %n) {
entry:
  %n1 = alloca i32
  store i32 %n, i32* %n1
  %result = alloca i8*
  %n2 = load i32, i32* %n1
  %tmp = icmp eq i32 %n2, 1
  br i1 %tmp, label %then, label %elif_check

then:                                             ; preds = %entry
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @fmt.14, i32 0, i32 0), i8** %result
  %result3 = load i8*, i8** %result
  ret i8* %result3
  br label %end

elif_check:                                       ; preds = %entry
  %n6 = load i32, i32* %n1
  %tmp7 = icmp eq i32 %n6, 2
  br i1 %tmp7, label %elif, label %else
  br label %end

elif:                                             ; preds = %elif_check
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fmt.15, i32 0, i32 0), i8** %result
  %result4 = load i8*, i8** %result
  ret i8* %result4

else:                                             ; preds = %elif_check
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fmt.16, i32 0, i32 0), i8** %result
  %result5 = load i8*, i8** %result
  ret i8* %result5
  br label %end

end:                                              ; preds = %else, %elif_check, %then
  ret i8* getelementptr inbounds ([1 x i8], [1 x i8]* @fmt.17, i32 0, i32 0)
}

define i32 @main() {
entry:
  %x = alloca i32
  %y = alloca i32
  %a = alloca double
  %b = alloca i32
  %c = alloca i8*
  %f = alloca i8*
  %img = alloca i8*
  %flag = alloca i1
  %line = alloca i8*
  %p = alloca i8*
  %list = alloca [2 x i32]
  store i32 2, i32* %x
  store i32 1, i32* %y
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.25, i32 0, i32 0), i8** %c
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.26, i32 0, i32 0), i8** %img
  %img1 = load i8*, i8** %img
  %c2 = load i8*, i8** %c
  %compose = call i8* @compose(i8* %c2, i8* %img1)
  store i8* %compose, i8** %p
  %list_ptr_ = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 0
  store i32 1, i32* %list_ptr_
  %list_ptr_3 = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 1
  store i32 2, i32* %list_ptr_3
  store i32 3, i32* %b
  store double 5.000000e-01, double* %a
  store i8* getelementptr inbounds ([37 x i8], [37 x i8]* @fmt.27, i32 0, i32 0), i8** %line
  %line4 = load i8*, i8** %line
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* %line4)
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @fmt.28, i32 0, i32 0))
  %line6 = load i8*, i8** %line
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* %line6)
  %printf8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @fmt.29, i32 0, i32 0))
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @fmt.30, i32 0, i32 0))
  %list_ptr_10 = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 0
  %list_elem_ = load i32, i32* %list_ptr_10
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %list_elem_)
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fmt.31, i32 0, i32 0))
  %list_ptr_13 = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 1
  %list_elem_14 = load i32, i32* %list_ptr_13
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %list_elem_14)
  %line16 = load i8*, i8** %line
  %printf17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* %line16)
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @fmt.32, i32 0, i32 0))
  %line19 = load i8*, i8** %line
  %printf20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* %line19)
  %printf21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @fmt.33, i32 0, i32 0))
  %x22 = load i32, i32* %x
  %y23 = load i32, i32* %y
  %permutation = call i32 @permutation(i32 %x22, i32 %y23)
  %printf24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %permutation)
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @fmt.34, i32 0, i32 0))
  %x26 = load i32, i32* %x
  %y27 = load i32, i32* %y
  %combination = call i32 @combination(i32 %x26, i32 %y27)
  %printf28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %combination)
  %printf29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @fmt.35, i32 0, i32 0))
  %a30 = load double, double* %a
  %x31 = load i32, i32* %x
  %power = call double @power(double %a30, i32 %x31)
  %printf32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.19, i32 0, i32 0), double %power)
  %printf33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @fmt.36, i32 0, i32 0))
  %x34 = load i32, i32* %x
  %x35 = load i32, i32* %x
  %a36 = load double, double* %a
  %binomial_probability = call double @binomial_probability(i32 %x34, i32 %x35, double %a36)
  %printf37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.19, i32 0, i32 0), double %binomial_probability)
  %printf38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @fmt.37, i32 0, i32 0))
  %printf39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.38, i32 0, i32 0))
  %p40 = load i8*, i8** %p
  %printf41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.24, i32 0, i32 0), i8* %p40)
  %printf42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @fmt.39, i32 0, i32 0))
  %p43 = load i8*, i8** %p
  %p44 = load i8*, i8** %p
  %computeComplex = call i8* @computeComplex(i8* %p43, i8* %p44, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @addString, i32 0, i32 0))
  %printf45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.24, i32 0, i32 0), i8* %computeComplex)
  %printf46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @fmt.40, i32 0, i32 0))
  %p47 = load i8*, i8** %p
  %p48 = load i8*, i8** %p
  %computeComplex49 = call i8* @computeComplex(i8* %p47, i8* %p48, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @subString.42, i32 0, i32 0))
  %printf50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.24, i32 0, i32 0), i8* %computeComplex49)
  %printf51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @fmt.45, i32 0, i32 0))
  %p52 = load i8*, i8** %p
  %p53 = load i8*, i8** %p
  %computeComplex54 = call i8* @computeComplex(i8* %p52, i8* %p53, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @mulString.48, i32 0, i32 0))
  %printf55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.24, i32 0, i32 0), i8* %computeComplex54)
  %printf56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.20, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @fmt.50, i32 0, i32 0))
  %p57 = load i8*, i8** %p
  %p58 = load i8*, i8** %p
  %computeComplex59 = call i8* @computeComplex(i8* %p57, i8* %p58, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @divString.54, i32 0, i32 0))
  %printf60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.24, i32 0, i32 0), i8* %computeComplex59)
  ret i32 0
}
