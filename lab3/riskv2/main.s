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
main:
.globl main
    addi sp, sp, -16 # выделение памяти в стеке
    sw ra, 12(sp) # запись ra в стек

    la a3, array_length
    la a7, x
    la a4, array
    la a5, array
    
    call gorner
    
    li a0, 4
    la a1, msg1
    ecall # вывод текста на консоль

    li a0, 1
    mv a1, a4
    ecall # вывод результата на консоль
    
    lw ra, 12(sp) # восстановление ra
    addi sp, sp, 16 # освобождение стека
    
    ret