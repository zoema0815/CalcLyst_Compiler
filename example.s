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
.LBB0_5:                                # %if_end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	8(%rsp), %esi
	incl	%esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
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
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jge	.LBB0_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	12(%rsp), %eax
	subl	%eax, 8(%rsp)
	jmp	.LBB0_5
	.p2align	4, 0x90
.LBB0_4:                                # %else
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	8(%rsp), %eax
	subl	%eax, 12(%rsp)
	jmp	.LBB0_5
.LBB0_6:                                # %while_end
	movl	8(%rsp), %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc
                                        # -- End function
	.globl	fibonacci               # -- Begin function fibonacci
	.p2align	4, 0x90
	.type	fibonacci,@function
fibonacci:                              # @fibonacci
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%edi, -8(%rsp)
	cmpl	$1, %edi
	jg	.LBB1_1
# %bb.5:                                # %then
	movl	-8(%rsp), %eax
	retq
.LBB1_1:                                # %if_end
	movl	$2, -16(%rsp)
	movl	$0, -12(%rsp)
	movl	$1, -20(%rsp)
	movl	$0, -4(%rsp)
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_3:                                # %while_body
                                        #   in Loop: Header=BB1_2 Depth=1
	movl	-20(%rsp), %eax
	movl	-12(%rsp), %ecx
	addl	%eax, %ecx
	movl	%ecx, -4(%rsp)
	movl	%eax, -12(%rsp)
	movl	%ecx, -20(%rsp)
	incl	-16(%rsp)
.LBB1_2:                                # %while
                                        # =>This Inner Loop Header: Depth=1
	movl	-16(%rsp), %eax
	cmpl	-8(%rsp), %eax
	jle	.LBB1_3
# %bb.4:                                # %while_end
	movl	-20(%rsp), %eax
	retq
.Lfunc_end1:
	.size	fibonacci, .Lfunc_end1-fibonacci
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
	jne	.LBB2_1
# %bb.3:                                # %then
	leaq	.Lfmt.21(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.LBB2_1:                                # %elif_check
	cmpl	$2, -12(%rsp)
	jne	.LBB2_2
# %bb.4:                                # %elif
	leaq	.Lfmt.22(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.LBB2_2:                                # %else
	leaq	.Lfmt.23(%rip), %rax
	movq	%rax, -8(%rsp)
	retq
.Lfunc_end2:
	.size	elseif, .Lfunc_end2-elseif
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	leaq	.Lfmt.32(%rip), %rdi
	movq	%rdi, 56(%rsp)
	leaq	.Lfmt.33(%rip), %rax
	movq	%rax, 48(%rsp)
	leaq	.Lfmt.34(%rip), %rsi
	movq	%rsi, 40(%rsp)
	leaq	.Lfmt.35(%rip), %rax
	movq	%rax, 32(%rsp)
	callq	compose@PLT
	movq	%rax, 16(%rsp)
	leaq	.Lfmt.36(%rip), %rax
	movq	%rax, 24(%rsp)
	movl	$5, 12(%rsp)
	movl	$3, 68(%rsp)
	movslq	12(%rsp), %rax
	imulq	$1431655766, %rax, %rax # imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	movl	%eax, 64(%rsp)
	movl	$1, %edi
	movl	$2, %esi
	callq	permutation@PLT
	movq	16(%rsp), %rsi
	leaq	.Lfmt.31(%rip), %r14
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	printf@PLT
	movq	56(%rsp), %rdi
	movq	48(%rsp), %rsi
	leaq	.LdivString(%rip), %rdx
	callq	computeReal@PLT
	movq	%rax, %rcx
	leaq	.Lfmt.29(%rip), %rbx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
	leaq	.LmulString.39(%rip), %rdx
	callq	computeImaginary@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rsi
	leaq	.LdivString.44(%rip), %rdx
	callq	computeComplex@PLT
	movq	%rax, %rcx
	xorl	%eax, %eax
	movq	%r14, %rdi
	movq	%rcx, %rsi
	callq	printf@PLT
	movl	$6, %edi
	movl	$3, %esi
	callq	permutation@PLT
	movl	%eax, %ecx
	leaq	.Lfmt.25(%rip), %rdi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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
	.asciz	"%d\n"
	.size	.Lfmt.14, 4

	.type	.Lfmt.15,@object        # @fmt.15
.Lfmt.15:
	.asciz	"%g\n"
	.size	.Lfmt.15, 4

	.type	.Lfmt.16,@object        # @fmt.16
.Lfmt.16:
	.asciz	"%s\n"
	.size	.Lfmt.16, 4

	.type	.Lfmt.17,@object        # @fmt.17
.Lfmt.17:
	.asciz	"%c\n"
	.size	.Lfmt.17, 4

	.type	.Lfmt.18,@object        # @fmt.18
.Lfmt.18:
	.asciz	"%s\n"
	.size	.Lfmt.18, 4

	.type	.Lfmt.19,@object        # @fmt.19
.Lfmt.19:
	.asciz	"%s\n"
	.size	.Lfmt.19, 4

	.type	.Lfmt.20,@object        # @fmt.20
.Lfmt.20:
	.asciz	"%s\n"
	.size	.Lfmt.20, 4

	.type	.Lfmt.21,@object        # @fmt.21
.Lfmt.21:
	.asciz	"I am If"
	.size	.Lfmt.21, 8

	.type	.Lfmt.22,@object        # @fmt.22
.Lfmt.22:
	.asciz	"I am elif"
	.size	.Lfmt.22, 10

	.type	.Lfmt.23,@object        # @fmt.23
.Lfmt.23:
	.asciz	"I am else"
	.size	.Lfmt.23, 10

	.type	.Lfmt.24,@object        # @fmt.24
.Lfmt.24:
	.zero	1
	.size	.Lfmt.24, 1

	.type	.Lfmt.25,@object        # @fmt.25
.Lfmt.25:
	.asciz	"%d\n"
	.size	.Lfmt.25, 4

	.type	.Lfmt.26,@object        # @fmt.26
.Lfmt.26:
	.asciz	"%g\n"
	.size	.Lfmt.26, 4

	.type	.Lfmt.27,@object        # @fmt.27
.Lfmt.27:
	.asciz	"%s\n"
	.size	.Lfmt.27, 4

	.type	.Lfmt.28,@object        # @fmt.28
.Lfmt.28:
	.asciz	"%c\n"
	.size	.Lfmt.28, 4

	.type	.Lfmt.29,@object        # @fmt.29
.Lfmt.29:
	.asciz	"%s\n"
	.size	.Lfmt.29, 4

	.type	.Lfmt.30,@object        # @fmt.30
.Lfmt.30:
	.asciz	"%s\n"
	.size	.Lfmt.30, 4

	.type	.Lfmt.31,@object        # @fmt.31
.Lfmt.31:
	.asciz	"%s\n"
	.size	.Lfmt.31, 4

	.type	.Lfmt.32,@object        # @fmt.32
.Lfmt.32:
	.asciz	"3.7r"
	.size	.Lfmt.32, 5

	.type	.Lfmt.33,@object        # @fmt.33
.Lfmt.33:
	.asciz	"2.5r"
	.size	.Lfmt.33, 5

	.type	.Lfmt.34,@object        # @fmt.34
.Lfmt.34:
	.asciz	"3.2i"
	.size	.Lfmt.34, 5

	.type	.Lfmt.35,@object        # @fmt.35
.Lfmt.35:
	.asciz	"1.42i"
	.size	.Lfmt.35, 6

	.type	.Lfmt.36,@object        # @fmt.36
.Lfmt.36:
	.asciz	"5.2@2.8i"
	.size	.Lfmt.36, 9

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

	.type	.LaddString.37,@object  # @addString.37
.LaddString.37:
	.asciz	"Add"
	.size	.LaddString.37, 4

	.type	.LsubString.38,@object  # @subString.38
.LsubString.38:
	.asciz	"Sub"
	.size	.LsubString.38, 4

	.type	.LmulString.39,@object  # @mulString.39
.LmulString.39:
	.asciz	"Mul"
	.size	.LmulString.39, 4

	.type	.LdivString.40,@object  # @divString.40
.LdivString.40:
	.asciz	"Div"
	.size	.LdivString.40, 4

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


	.section	".note.GNU-stack","",@progbits
