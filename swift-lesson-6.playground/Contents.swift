import UIKit

//Задание №1 - Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//Задание №2 - Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//Задание №3 - Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.removeFirst()
    }
    
    var isEmpty: Bool {
        return elements.count == 0
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var result = [T]()
        for element in elements {
            if predicate(element) {
                result.append(element)
            }
        }
        return result
    }
    
    subscript (index: Int) -> T? {
        return index > self.elements.count-1 ? nil : elements[index]
    }
}

var queue = Queue<Int>()
queue.push(element: 0)
queue.push(element: 2)
queue.push(element: 4)
queue.push(element: 7)
queue.push(element: 11)
queue.push(element: 16)
queue.push(element: 22)

queue.isEmpty

print(queue)
queue.pop()
queue.pop()
print(queue)

let filteredQueue = queue.filter(predicate: { $0 % 2 == 0 })
print(filteredQueue)

queue[1]
queue[5]
