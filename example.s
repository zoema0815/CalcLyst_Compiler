	.text
	.file	"Calclyst"
	.globl	gcd                     # -- Begin function gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	%edi, 8(%rsp)
	movl	%esi, 12(%rsp)
	leaq	.Lfmt(%rip), %rbx
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                # %else
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	8(%rsp), %eax
	subl	%eax, 12(%rsp)
.LBB0_5:                                # %if_end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	8(%rsp), %esi
	incl	%esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_1:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %eax
	cmpl	12(%rsp), %eax
	je	.LBB0_6
# %bb.2:                                # %while_body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	8(%rsp), %esi
	addl	$3, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jge	.LBB0_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	12(%rsp), %eax
	subl	%eax, 8(%rsp)
	jmp	.LBB0_5
.LBB0_6:                                # %while_end
	movl	8(%rsp), %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc
                                        # -- End function
	.globl	elseif                  # -- Begin function elseif
	.p2align	4, 0x90
	.type	elseif,@function
elseif:                                 # @elseif
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edi, -12(%rsp)
	cmpl	$1, %edi
	jne	.LBB1_1
# %bb.3:                                # %then
	leaq	.Lfmt.14(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.LBB1_1:                                # %elif_check
	cmpl	$2, -12(%rsp)
	jne	.LBB1_2
# %bb.4:                                # %elif
	leaq	.Lfmt.15(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.LBB1_2:                                # %else
	leaq	.Lfmt.16(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.Lfunc_end1:
	.size	elseif, .Lfunc_end1-elseif
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$2, 4(%rsp)
	movl	$1, 20(%rsp)
	leaq	.Lfmt.25(%rip), %rdi
	movq	%rdi, 64(%rsp)
	leaq	.Lfmt.26(%rip), %rsi
	movq	%rsi, 56(%rsp)
	callq	compose@PLT
	movq	%rax, 8(%rsp)
	movabsq	$8589934593, %rax       # imm = 0x200000001
	movq	%rax, 44(%rsp)
	movl	$3, 52(%rsp)
	movabsq	$4602678819172646912, %rax # imm = 0x3FE0000000000000
	movq	%rax, 32(%rsp)
	leaq	.Lfmt.27(%rip), %rsi
	movq	%rsi, 24(%rsp)
	leaq	.Lfmt.20(%rip), %rbx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.28(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.29(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.30(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	44(%rsp), %esi
	leaq	.Lfmt.18(%rip), %r14
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.31(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	48(%rsp), %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.32(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	24(%rsp), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.33(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	4(%rsp), %edi
	movl	20(%rsp), %esi
	callq	permutation@PLT
	movq	%r14, %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.34(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	4(%rsp), %edi
	movl	20(%rsp), %esi
	callq	combination@PLT
	movq	%r14, %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.35(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movsd	32(%rsp), %xmm0         # xmm0 = mem[0],zero
	movl	4(%rsp), %edi
	callq	power@PLT
	leaq	.Lfmt.19(%rip), %r14
	movq	%r14, %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.Lfmt.36(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	4(%rsp), %edi
	movsd	32(%rsp), %xmm0         # xmm0 = mem[0],zero
	movl	%edi, %esi
	callq	binomial_probability@PLT
	movq	%r14, %rdi
	movb	$1, %al
	callq	printf@PLT
	leaq	.Lfmt.37(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.38(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rsi
	leaq	.Lfmt.24(%rip), %r14
	movq	%r14, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.39(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rdi
	leaq	.LaddString(%rip), %rdx
	movq	%rdi, %rsi
	callq	computeComplex@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.40(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rdi
	leaq	.LsubString.42(%rip), %rdx
	movq	%rdi, %rsi
	callq	computeComplex@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.45(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rdi
	leaq	.LmulString.48(%rip), %rdx
	movq	%rdi, %rsi
	callq	computeComplex@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	.Lfmt.50(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	8(%rsp), %rdi
	leaq	.LdivString.54(%rip), %rdx
	movq	%rdi, %rsi
	callq	computeComplex@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$88, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.type	n,@object               # @n
	.bss
	.globl	n
	.p2align	2
n:
	.long	0                       # 0x0
	.size	n, 4

	.type	count,@object           # @count
	.globl	count
	.p2align	2
count:
	.long	0                       # 0x0
	.size	count, 4

	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%g\n"
	.size	.Lfmt.1, 4

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%s\n"
	.size	.Lfmt.2, 4

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%c\n"
	.size	.Lfmt.3, 4

	.type	.Lfmt.4,@object         # @fmt.4
.Lfmt.4:
	.asciz	"%s\n"
	.size	.Lfmt.4, 4

	.type	.Lfmt.5,@object         # @fmt.5
.Lfmt.5:
	.asciz	"%s\n"
	.size	.Lfmt.5, 4

	.type	.Lfmt.6,@object         # @fmt.6
.Lfmt.6:
	.asciz	"%s\n"
	.size	.Lfmt.6, 4

	.type	.Lfmt.7,@object         # @fmt.7
.Lfmt.7:
	.asciz	"%d\n"
	.size	.Lfmt.7, 4

	.type	.Lfmt.8,@object         # @fmt.8
.Lfmt.8:
	.asciz	"%g\n"
	.size	.Lfmt.8, 4

	.type	.Lfmt.9,@object         # @fmt.9
.Lfmt.9:
	.asciz	"%s\n"
	.size	.Lfmt.9, 4

	.type	.Lfmt.10,@object        # @fmt.10
.Lfmt.10:
	.asciz	"%c\n"
	.size	.Lfmt.10, 4

	.type	.Lfmt.11,@object        # @fmt.11
.Lfmt.11:
	.asciz	"%s\n"
	.size	.Lfmt.11, 4

	.type	.Lfmt.12,@object        # @fmt.12
.Lfmt.12:
	.asciz	"%s\n"
	.size	.Lfmt.12, 4

	.type	.Lfmt.13,@object        # @fmt.13
.Lfmt.13:
	.asciz	"%s\n"
	.size	.Lfmt.13, 4

	.type	.Lfmt.14,@object        # @fmt.14
.Lfmt.14:
	.asciz	"I am If"
	.size	.Lfmt.14, 8

	.type	.Lfmt.15,@object        # @fmt.15
.Lfmt.15:
	.asciz	"I am elif"
	.size	.Lfmt.15, 10

	.type	.Lfmt.16,@object        # @fmt.16
.Lfmt.16:
	.asciz	"I am else"
	.size	.Lfmt.16, 10

	.type	.Lfmt.17,@object        # @fmt.17
.Lfmt.17:
	.zero	1
	.size	.Lfmt.17, 1

	.type	.Lfmt.18,@object        # @fmt.18
.Lfmt.18:
	.asciz	"%d\n"
	.size	.Lfmt.18, 4

	.type	.Lfmt.19,@object        # @fmt.19
.Lfmt.19:
	.asciz	"%g\n"
	.size	.Lfmt.19, 4

	.type	.Lfmt.20,@object        # @fmt.20
.Lfmt.20:
	.asciz	"%s\n"
	.size	.Lfmt.20, 4

	.type	.Lfmt.21,@object        # @fmt.21
.Lfmt.21:
	.asciz	"%c\n"
	.size	.Lfmt.21, 4

	.type	.Lfmt.22,@object        # @fmt.22
.Lfmt.22:
	.asciz	"%s\n"
	.size	.Lfmt.22, 4

	.type	.Lfmt.23,@object        # @fmt.23
.Lfmt.23:
	.asciz	"%s\n"
	.size	.Lfmt.23, 4

	.type	.Lfmt.24,@object        # @fmt.24
.Lfmt.24:
	.asciz	"%s\n"
	.size	.Lfmt.24, 4

	.type	.Lfmt.25,@object        # @fmt.25
.Lfmt.25:
	.asciz	"1.0r"
	.size	.Lfmt.25, 5

	.type	.Lfmt.26,@object        # @fmt.26
.Lfmt.26:
	.asciz	"2.0i"
	.size	.Lfmt.26, 5

	.type	.Lfmt.27,@object        # @fmt.27
.Lfmt.27:
	.asciz	"------------------------------------"
	.size	.Lfmt.27, 37

	.type	.Lfmt.28,@object        # @fmt.28
.Lfmt.28:
	.asciz	"             Array Test"
	.size	.Lfmt.28, 24

	.type	.Lfmt.29,@object        # @fmt.29
.Lfmt.29:
	.asciz	"Initializing Array of list = {1, 2}"
	.size	.Lfmt.29, 36

	.type	.Lfmt.30,@object        # @fmt.30
.Lfmt.30:
	.asciz	"list[0] = "
	.size	.Lfmt.30, 11

	.type	.Lfmt.31,@object        # @fmt.31
.Lfmt.31:
	.asciz	"list[] = "
	.size	.Lfmt.31, 10

	.type	.Lfmt.32,@object        # @fmt.32
.Lfmt.32:
	.asciz	"        Build-In Function Test"
	.size	.Lfmt.32, 31

	.type	.Lfmt.33,@object        # @fmt.33
.Lfmt.33:
	.asciz	"I. Permutation Test  -> P(2, 1) ="
	.size	.Lfmt.33, 34

	.type	.Lfmt.34,@object        # @fmt.34
.Lfmt.34:
	.asciz	"II. Combination Test  -> C(2, 1) ="
	.size	.Lfmt.34, 35

	.type	.Lfmt.35,@object        # @fmt.35
.Lfmt.35:
	.asciz	"III. Power Test -> Power(1.5, 2) ="
	.size	.Lfmt.35, 35

	.type	.Lfmt.36,@object        # @fmt.36
.Lfmt.36:
	.asciz	"IV. Bionomial Prob Test -> P(n = 2, p = 0.5, r = 2): ="
	.size	.Lfmt.36, 55

	.type	.Lfmt.37,@object        # @fmt.37
.Lfmt.37:
	.asciz	"Complex Number Calculation"
	.size	.Lfmt.37, 27

	.type	.Lfmt.38,@object        # @fmt.38
.Lfmt.38:
	.asciz	"p = "
	.size	.Lfmt.38, 5

	.type	.Lfmt.39,@object        # @fmt.39
.Lfmt.39:
	.asciz	"p + p = "
	.size	.Lfmt.39, 9

	.type	.LaddString,@object     # @addString
.LaddString:
	.asciz	"Add"
	.size	.LaddString, 4

	.type	.LsubString,@object     # @subString
.LsubString:
	.asciz	"Sub"
	.size	.LsubString, 4

	.type	.LmulString,@object     # @mulString
.LmulString:
	.asciz	"Mul"
	.size	.LmulString, 4

	.type	.LdivString,@object     # @divString
.LdivString:
	.asciz	"Div"
	.size	.LdivString, 4

	.type	.Lfmt.40,@object        # @fmt.40
.Lfmt.40:
	.asciz	"p - p = "
	.size	.Lfmt.40, 9

	.type	.LaddString.41,@object  # @addString.41
.LaddString.41:
	.asciz	"Add"
	.size	.LaddString.41, 4

	.type	.LsubString.42,@object  # @subString.42
.LsubString.42:
	.asciz	"Sub"
	.size	.LsubString.42, 4

	.type	.LmulString.43,@object  # @mulString.43
.LmulString.43:
	.asciz	"Mul"
	.size	.LmulString.43, 4

	.type	.LdivString.44,@object  # @divString.44
.LdivString.44:
	.asciz	"Div"
	.size	.LdivString.44, 4

	.type	.Lfmt.45,@object        # @fmt.45
.Lfmt.45:
	.asciz	"p * p = "
	.size	.Lfmt.45, 9

	.type	.LaddString.46,@object  # @addString.46
.LaddString.46:
	.asciz	"Add"
	.size	.LaddString.46, 4

	.type	.LsubString.47,@object  # @subString.47
.LsubString.47:
	.asciz	"Sub"
	.size	.LsubString.47, 4

	.type	.LmulString.48,@object  # @mulString.48
.LmulString.48:
	.asciz	"Mul"
	.size	.LmulString.48, 4

	.type	.LdivString.49,@object  # @divString.49
.LdivString.49:
	.asciz	"Div"
	.size	.LdivString.49, 4

	.type	.Lfmt.50,@object        # @fmt.50
.Lfmt.50:
	.asciz	"p / p = "
	.size	.Lfmt.50, 9

	.type	.LaddString.51,@object  # @addString.51
.LaddString.51:
	.asciz	"Add"
	.size	.LaddString.51, 4

	.type	.LsubString.52,@object  # @subString.52
.LsubString.52:
	.asciz	"Sub"
	.size	.LsubString.52, 4

	.type	.LmulString.53,@object  # @mulString.53
.LmulString.53:
	.asciz	"Mul"
	.size	.LmulString.53, 4

	.type	.LdivString.54,@object  # @divString.54
.LdivString.54:
	.asciz	"Div"
	.size	.LdivString.54, 4

	.section	".note.GNU-stack","",@progbits
