import UIKit

struct Sorting {
    static func selectionSort(array arr: inout [Int]) -> [Int] {
        for i in 0..<arr.count {
            var min = arr[i]
            var pos = i
            for j in i+1..<arr.count {
                if arr[j] < min {
                    min = arr[j]
                    pos = j
                }
            }
            if min != arr[i] {
                arr.swapAt(i, pos)
            }
        }
        return arr
    }
}

var arr = [22, 11, 33, 44, 2, 3]
Sorting.selectionSort(array: &arr)
print(arr)
