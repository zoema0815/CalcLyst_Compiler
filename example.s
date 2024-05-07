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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movl	$1, 8(%rsp)
	movl	$3, 4(%rsp)
	leaq	.Lfmt.18(%rip), %rbx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	movl	4(%rsp), %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	printf@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
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


	.section	".note.GNU-stack","",@progbits
