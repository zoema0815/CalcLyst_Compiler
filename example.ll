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
@fmt.14 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.15 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.16 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.17 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@fmt.18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.19 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.20 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.21 = private unnamed_addr constant [8 x i8] c"I am If\00", align 1
@fmt.22 = private unnamed_addr constant [10 x i8] c"I am elif\00", align 1
@fmt.23 = private unnamed_addr constant [10 x i8] c"I am else\00", align 1
@fmt.24 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@fmt.25 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.26 = private unnamed_addr constant [4 x i8] c"%g\0A\00", align 1
@fmt.27 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.28 = private unnamed_addr constant [4 x i8] c"%c\0A\00", align 1
@fmt.29 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.30 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.31 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@fmt.32 = private unnamed_addr constant [5 x i8] c"3.7r\00", align 1
@fmt.33 = private unnamed_addr constant [5 x i8] c"2.5r\00", align 1
@fmt.34 = private unnamed_addr constant [5 x i8] c"3.2i\00", align 1
@fmt.35 = private unnamed_addr constant [6 x i8] c"1.42i\00", align 1
@fmt.36 = private unnamed_addr constant [9 x i8] c"5.2@2.8i\00", align 1
@addString = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@addString.37 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString.38 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString.39 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString.40 = private unnamed_addr constant [4 x i8] c"Div\00", align 1
@addString.41 = private unnamed_addr constant [4 x i8] c"Add\00", align 1
@subString.42 = private unnamed_addr constant [4 x i8] c"Sub\00", align 1
@mulString.43 = private unnamed_addr constant [4 x i8] c"Mul\00", align 1
@divString.44 = private unnamed_addr constant [4 x i8] c"Div\00", align 1

declare i32 @printf(i8*, ...)

declare i8* @sconcat(i8*, i8*)

declare i8* @compose(i8*, i8*)

declare i8* @computeReal(i8*, i8*, i8*)

declare i8* @computeImaginary(i8*, i8*, i8*)

declare i8* @computeComplex(i8*, i8*, i8*)

declare i32 @permutation(i32, i32)

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

define i32 @fibonacci(i32 %n) {
entry:
  %n1 = alloca i32
  store i32 %n, i32* %n1
  %g = alloca i32
  %h = alloca i32
  %i = alloca i32
  %count = alloca i32
  %n2 = load i32, i32* %n1
  %tmp = icmp sle i32 %n2, 1
  br i1 %tmp, label %then, label %else

then:                                             ; preds = %entry
  %n3 = load i32, i32* %n1
  ret i32 %n3

else:                                             ; preds = %entry
  br label %if_end

if_end:                                           ; preds = %else
  store i32 2, i32* %count
  store i32 0, i32* %g
  store i32 1, i32* %h
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %if_end
  %count4 = load i32, i32* %count
  %n5 = load i32, i32* %n1
  %tmp6 = icmp sle i32 %count4, %n5
  br i1 %tmp6, label %while_body, label %while_end

while_body:                                       ; preds = %while
  %g7 = load i32, i32* %g
  %h8 = load i32, i32* %h
  %tmp9 = add i32 %g7, %h8
  store i32 %tmp9, i32* %i
  %h10 = load i32, i32* %h
  store i32 %h10, i32* %g
  %i11 = load i32, i32* %i
  store i32 %i11, i32* %h
  %count12 = load i32, i32* %count
  %tmp13 = add i32 %count12, 1
  store i32 %tmp13, i32* %count
  br label %while

while_end:                                        ; preds = %while
  %h14 = load i32, i32* %h
  ret i32 %h14
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
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @fmt.21, i32 0, i32 0), i8** %result
  %result3 = load i8*, i8** %result
  ret i8* %result3
  br label %end

elif_check:                                       ; preds = %entry
  %n6 = load i32, i32* %n1
  %tmp7 = icmp eq i32 %n6, 2
  br i1 %tmp7, label %elif, label %else
  br label %end

elif:                                             ; preds = %elif_check
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fmt.22, i32 0, i32 0), i8** %result
  %result4 = load i8*, i8** %result
  ret i8* %result4

else:                                             ; preds = %elif_check
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @fmt.23, i32 0, i32 0), i8** %result
  %result5 = load i8*, i8** %result
  ret i8* %result5
  br label %end

end:                                              ; preds = %else, %elif_check, %then
  ret i8* getelementptr inbounds ([1 x i8], [1 x i8]* @fmt.24, i32 0, i32 0)
}

define i32 @main() {
entry:
  %x = alloca i32
  %y = alloca i32
  %b = alloca i32
  %c = alloca i8*
  %f = alloca i8*
  %d = alloca i8*
  %g = alloca i8*
  %z = alloca i8*
  %w = alloca i8*
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.32, i32 0, i32 0), i8** %c
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.33, i32 0, i32 0), i8** %f
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @fmt.34, i32 0, i32 0), i8** %d
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @fmt.35, i32 0, i32 0), i8** %g
  %d1 = load i8*, i8** %d
  %c2 = load i8*, i8** %c
  %compose = call i8* @compose(i8* %c2, i8* %d1)
  store i8* %compose, i8** %z
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @fmt.36, i32 0, i32 0), i8** %w
  store i32 5, i32* %x
  store i32 3, i32* %y
  %x3 = load i32, i32* %x
  %y4 = load i32, i32* %y
  %tmp = sdiv i32 %x3, %y4
  store i32 %tmp, i32* %b
  %permutation = call i32 @permutation(i32 1, i32 2)
  %z5 = load i8*, i8** %z
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.31, i32 0, i32 0), i8* %z5)
  %c6 = load i8*, i8** %c
  %f7 = load i8*, i8** %f
  %computeReal = call i8* @computeReal(i8* %c6, i8* %f7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @divString, i32 0, i32 0))
  %printf8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.29, i32 0, i32 0), i8* %computeReal)
  %d9 = load i8*, i8** %d
  %g10 = load i8*, i8** %g
  %computeImaginary = call i8* @computeImaginary(i8* %d9, i8* %g10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @mulString.39, i32 0, i32 0))
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.29, i32 0, i32 0), i8* %computeImaginary)
  %z12 = load i8*, i8** %z
  %w13 = load i8*, i8** %w
  %computeComplex = call i8* @computeComplex(i8* %z12, i8* %w13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @divString.44, i32 0, i32 0))
  %printf14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.31, i32 0, i32 0), i8* %computeComplex)
  %permutation15 = call i32 @permutation(i32 6, i32 3)
  %printf16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.25, i32 0, i32 0), i32 %permutation15)
  ret i32 0
}
