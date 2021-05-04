.rodata
array_length:
.word 5 # кол-во коэффициентов
x:
.word 2 # x0 - значение x, по которому ищется значение многочлена
msg1: 
.string "f(x) = " # строка для вывода на консоль
array:
.word 1, 3, 5, 7, 9 # массив коэффициентов начиная со старшего
 
.text
start:
.globl start
    la a3, array_length
    lw a3, 0(a3)
    la a7, x
    lw a7, 0(a7)
    li a2, 1 # счетчик итераций
    la a4, array 
    lw a4, 0(a4) # загрузка первого элемента массива
    la a5, array

loop:
    slli a6, a2, 2 # a6 = a2 << 2 = a2 * 4
    add a6, a5, a6 # a6 = a5 + a6 = a5 + a2 * 4
    lw a6, 0(a6)  
    mul a4, a4, a7 # a4 = a4 * a7
    add a4, a4, a6 # a4 = a4 + a6

    addi a2, a2, 1
    bltu a2, a3, loop # if (a2 < a3) goto loop

finish:
    li a0, 4
    la a1, msg1
    ecall # вывод текста на консоль

    li a0, 1
    mv a1, a4
    ecall # вывод результата на консоль

    li a0, 10
    ecall # конец программы   