import UIKit

let arrOne: [Int?] = [1, 2, 3, 4, 5]
let arrTwo: [Int?] = [1, nil, nil, 4, nil]

let unwrappedArrOne = arrOne.compactMap { $0 }
let unwrappedArrTwo = arrTwo.compactMap { $0 }

print(unwrappedArrOne)
print(unwrappedArrTwo)

