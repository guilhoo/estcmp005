; nasm -f elf64 main.asm && gcc -no-pie main.o && ./a.out   
    global main
    extern printf
    extern scanf
    extern puts

section .text
main: 
        ; exibe msg ap1
        mov rdi, msgAp1
        call puts

        ; scanf
        mov rdi, formatin
        mov rax, 1
        sub rsp,8
        call scanf
        add rsp,8
        movsd [ap1], xmm0

        ; msg ap2
        mov rdi, msgAp2
        call puts

        ;scanf
        mov rdi, formatin
        mov rax, 1
        sub rsp, 8
        call scanf
        add rsp, 8
        movsd [ap2], xmm0

        ; soma ap1 + ap2 e / por 2
        movsd xmm0, [ap1]
        addsd xmm0, [ap2]
        movsd xmm1, [_2]
        divsd xmm0, xmm1
        movsd [media], xmm0

        ;verifica se media >= 8
        mov rax, [media]
        cmp rax,[_8]
        jge aprovado ; pula pra aprovado

        cmp rax, [_4] ; verifica se menor que 4 e ja reprova direto
        jl reprovado

        mov rdi, msgPF ; msg pf
        call puts

        mov rdi, formatin ; scanf pf
        mov rax, 1
        sub rsp, 8
        call scanf
        add rsp, 8
        movsd [pf], xmm0

        movsd xmm0, [ap1] ; soma ap1 + ap2 + pf
        addsd xmm0, [ap2]
        addsd xmm0, [pf]
        movsd xmm1, [_3]
        divsd xmm0, xmm1
        movsd [media], xmm0

        mov rax, [media] ; verifica se >= 6
        cmp rax,[_6]
        jge aprovado

        jmp reprovado ; nao deu

        jmp fim

aprovado:
        mov rdi, msgAprovado
        call puts
        jmp fim

reprovado:
        mov rdi, msgReprovado
        call puts
        jmp fim

fim:    
        mov rdi, msgMedia
        movsd xmm0, [media]
        mov rax, 1
        sub rsp, 8
        call printf
        add rsp, 8
        ret



section .data
    msgAp1: db "Digite a nota da AP1", 0
    msgAp2: db "Digite a nota da Ap2", 0
    msgPF: db "Digite a nota da PF", 0
    msgAprovado: db "Aprovado", 0
    msgReprovado: db "Reprovado", 0
    msgMedia: db "media: %.2f",10, 0
    formatin: db "%lf", 0
    ap1: dq 0.0
    ap2: dq 0.0
    pf: dq 0.0
    media: dq 0.0
    _2: dq 2.0
    _3: dq 3.0
    _4: dq 4.0
    _6: dq 6.0
    _8: dq 8.0