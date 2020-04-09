    .syntax unified

    @ --------------------------------
    .global main
main:
    @ Stack the return address (lr) in addition to a dummy register (ip) to
    @ keep the stack 8-byte aligned.
    push    {ip, lr}

    @ Load the argument and perform the call. This is like 'printf("...")' in C.
    ldr     r0, =pikuline1
    bl      printf

    ldr     r0, =pikuline2
    bl      printf

    ldr     r0, =pikuline3
    bl      printf



    @ Exit from 'main'. This is like 'return 0' in C.
    mov     r0, #0      @ Return 0.
    @ Pop the dummy ip to reverse our alignment fix, and pop the original lr
    @ value directly into pc — the Program Counter — to return.
    pop     {ip, pc}

    @ --------------------------------
    @ Data for the printf call. The GNU assembler's ".asciz" directive
    @ automatically adds a NULL character termination.

pikuline1:
    .asciz  "Slow and Tedious\n"  
pikuline2:
    .asciz  "Defines the Poly Pi Servers\n"
pikuline3:
    .asciz  "And displeases me!\n"  

