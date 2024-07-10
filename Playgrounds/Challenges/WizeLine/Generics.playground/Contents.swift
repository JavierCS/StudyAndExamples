/*:
 # Instructions
 Given the following function rewrite it with generics and allows to any type `T` that conforms to the `Equatable` protocol.
 The `findIndex(ofString:in:)` function returns an optional `Int` value, which will be the index of the first matching string in the array if it’s found, or nil if the string can’t be found:
 */

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    /// Implement the code here
    return nil
}

func findIndex<T:Equatable>(ofObject valueToFind: T, in array: [T]) -> Int? {
    return array.firstIndex(of: valueToFind)
}

let arr: [Int] = [1,2,3,4,5]

findIndex(ofObject: 3, in: arr)
