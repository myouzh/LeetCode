
import Foundation

/**
 找出数组中没有出现的最小正整数 用O(n)算法  解法:创建空数组
 数组 [4,-1,9,6,10] 最小正整数是 1
 数组 [3,1,-6,7,10] 最小正整数是 2
 */
func findMinNum(_ nums:[Int]) -> Int {
    var newNums = Array(repeating: 0, count: nums.count)
    for num in nums {
        if num <= 0 || num > nums.count {
            continue
        }
        newNums[num-1] = num
    }
    var theNum = nums.count + 1
    for (index, item) in newNums.enumerated() {
        if item == 0 {
            theNum = index + 1
            break
        }
    }
    return theNum
}

let answer = findMinNum([1,2,3,4,6])
print("the answer is :\(answer)")


