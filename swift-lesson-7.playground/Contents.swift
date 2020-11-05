import UIKit

//Задание №1 - Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//Задание №2 - Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum GroupOfEmployeesError: Error {
    case notFound
}

struct Employee {
    let name: String
    let surname: String
    let age: Int
    var rating: Int
}

class GroupOfEmployees {
    var employees = [
        "1": Employee(name: "Иван", surname: "Иванов", age: 22, rating: 15),
        "2": Employee(name: "Максим", surname: "Сидоров", age: 35, rating: 4),
        "3": Employee(name: "Борис", surname: "Доля", age: 18, rating: 19),
        "4": Employee(name: "Александр", surname: "Григорьев", age: 29, rating: 7),
        "5": Employee(name: "Петр", surname: "Чайковский", age: 30, rating: 13)
    ]
    
    func getInfo(number employee: String) throws -> Employee {
        guard let man = employees[employee] else {
            throw GroupOfEmployeesError.notFound
        }
        return man
    }
}

let employees = GroupOfEmployees()
do {
    let employee = try employees.getInfo(number: "7")
    print(employee)
} catch GroupOfEmployeesError.notFound {
    print("Сотрудник не найден")
}
