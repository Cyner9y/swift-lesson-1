import UIKit

//Задание №1 - Написать функцию, которая определяет, четное число или нет.

func IsEvenNumber(number:Int){
    number % 2 == 0 ? print("Число " + String(number) + " четное") : print("Число " + String(number) + " нечетное")
    //для дробных чисел
    //number.remainder(dividingBy: 2) == 0 ? print("Число " + String(number) + " четное") : print("Число " + String(number) + " нечетное")
}

print("Задание №1:")
IsEvenNumber(number: 3)
IsEvenNumber(number: 2)
IsEvenNumber(number: 0)
IsEvenNumber(number: -2)
IsEvenNumber(number: -3)




//Задание №2 - Написать функцию, которая определяет, делится ли число без остатка на 3.

func IsDivThreeWithoutRemainder(number:Int){
    number % 3 == 0 ? print("Число " + String(number) + " делится без остатка на 3.") : print("Число " + String(number) + " не делится без остатка на 3")
}

print("\nЗадание №2:")
IsDivThreeWithoutRemainder(number: 7)
IsDivThreeWithoutRemainder(number: 3)
IsDivThreeWithoutRemainder(number: 0)
IsDivThreeWithoutRemainder(number: -3)
IsDivThreeWithoutRemainder(number: -5)


 

//Задание №3 - Создать возрастающий массив из 100 чисел

func increasingArray(initialValue: Int ,size: Int) -> Array<Int>{
    var arr = [Int]()
    for index in 0...size - 1 {
        arr.append(initialValue + index)
    }
    return arr
}

print("\nЗадание №3:")
print(increasingArray(initialValue: -10, size: 100))




//Задание №4 - Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var array1 = increasingArray(initialValue: 0, size: 100)

for element in array1 {
    if element % 2 == 0  || element % 3 != 0 {
        array1.remove(at: array1.firstIndex(of: element)!)
    }
}

print("\nЗадание №4:")
print(array1)
 
 
 
 
//Задание №5 - Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

var array2 = [0, 1]

for i in 2...50 {
    let element = array2[i-2] + array2[i-1]
    array2.append(element)
}

print(array2)

 


//Задание №6 - Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

var array3 = increasingArray(initialValue: 2, size: 100)

for (index, value) in array3.enumerated() {
    if value * value < array3.last! {
        var  i = index + 1
        while i < array3.count {
            if array3[i] % value == 0 {
                array3.remove(at: i)
            }
            i += 1
        }
    }
}

print("\nЗадание №4:")
print(array3)
