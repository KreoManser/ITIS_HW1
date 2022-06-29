// MARK: - Number 1
protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct Service: HomeworkService {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let result = x / y
        let remain = x % y
        return (result, remain)
    }

    func fibonacci(n: Int) -> [Int] {
        assert(n > 1)

        var array = [0, 1]

        while array.count < n {
            array.append(array[array.count - 1] + array[array.count - 2])
        }

        return array
    }

    func sort(rawArray: [Int]) -> [Int] {
        guard rawArray.count > 1 else { return rawArray }

        var sortedArray = rawArray

        for i in 0..<sortedArray.count {
            for j in 0..<sortedArray.count - i - 1 {
                if sortedArray[j] > sortedArray[j + 1] {
                    sortedArray.swapAt(j + 1, j)
                }
            }
        }

        return sortedArray
    }

    func firstLetter(strings: [String]) -> [Character] {
        var characters: [Character] = []
        for string in strings {
            for character in string {
                characters.append(character)
                break
            }
        }

        return characters
    }

    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var filteredArray: [Int] = []
            for number in array {
                if !condition(number) {
                    filteredArray.append(number)
                }
            }
            return filteredArray
    }
}


// MARK: - Number 2
// Классы высосаны из пальца ввиду недостатка воображения :)

enum Places {
    case hole(with: String?)
    case adminRoom
    case street
}

enum GenreOfBooks: CaseIterable {
    case horror
    case literature
    case learning
    case programming
    case manga
}

protocol Walk {
    func go(to place: Places)
}

fileprivate protocol DoSomethingInLibrary {
    func takeABook()
    func readInHole()
}

fileprivate struct dateOfBirth {
    let day: Int
    let month: String
    let year: Int
}

open class Library {
    func go(to place: Places) {
        print("You went to the \(place)")
    }
}

final internal class LibraryKazan: Library {
    public struct Book {
        let author: String
        let date: Int
    }
    
    private struct Admin {
        let name: String
        let yearOfBirth: dateOfBirth
    }
}

class Human {
    func goToLibrary() {
        print("I'm come in")
    }
}

class Student: Human {
    let course: Int
    
    init(course: Int) {
        self.course = course
    }
}

class Reader: DoSomethingInLibrary, Walk {
    func takeABook() {
        let rand = GenreOfBooks.allCases.randomElement()!
        print("Read this book \(rand)!")
    }
    
    func readInHole() {
        print("Reading...")
    }
    
    func go(to place: Places) {
        print("You went to the \(place)")
    }
}
