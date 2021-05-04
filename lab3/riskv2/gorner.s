.text
gorner:
.global gorner
    lw a3, 0(a3)
    lw a7, 0(a7)
    li a2, 1 # счетчик итераций
    lw a4, 0(a4) # загрузка первого элемента массива
    
loop:
    slli a6, a2, 2 # a6 = a2 << 2 = a2 * 4
    add a6, a5, a6 # a6 = a5 + a6 = a5 + a2 * 4
    lw a6, 0(a6)  
    mul a4, a4, a7 # a4 = a4 * a7
    add a4, a4, a6 # a4 = a4 + a6

    addi a2, a2, 1
    bltu a2, a3, loop # if (a2 < a3) goto loop
    
    ret