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
  %b = alloca i32
  %c = alloca i8*
  %f = alloca i8*
  %flag = alloca i1
  %list = alloca [2 x i32]
  %list_ptr_ = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 0
  store i32 1, i32* %list_ptr_
  store i32 3, i32* %b
  %list_ptr_1 = getelementptr inbounds [2 x i32], [2 x i32]* %list, i32 0, i32 0
  %list_elem_ = load i32, i32* %list_ptr_1
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %list_elem_)
  %b2 = load i32, i32* %b
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.18, i32 0, i32 0), i32 %b2)
  ret i32 0
}
