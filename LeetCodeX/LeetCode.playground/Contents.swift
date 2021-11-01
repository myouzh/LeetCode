import UIKit

/**
 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。
 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。
 输入：nums = [10,2]
 输出："210"

 输入：nums = [3,30,34,5,9]
 输出："9534330"
 链接：https://leetcode-cn.com/problems/largest-number
 */

var nums = [3,30,34,5,9]

var strArr = nums.map { a in
    String(a)
}

print(strArr)

func largestNumber(_ nums: [Int]) -> String {
    var strArr = nums.map { String($0) }
    strArr.sort{ $0+$1 > $1+$0 }
    return ""
}


/**
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。
 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
 https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/
 */

/// 解法一:循环一次,用哈希表寻找 🚫寻找太多导致时间过长
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var conArr:Array<Int> = []
    var targetArr:Array<Int> = []
    for item in nums {
        let findNum = target - item
        if conArr.contains(findNum) {
            targetArr = [findNum,item]
            break
        }
        conArr.append(item)
    }
    return targetArr
}

/// 解法二: 双指针寻找
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var l = 0
    var r = nums.count-1
    var sum:Int
    while l < r {
        sum = nums[l] + nums[r]
        if target > sum {
            l += 1
        } else if target < sum {
            r -= 1
        } else {
            return [nums[l], nums[r]]
        }
    }
    return []
}

/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 输入：s = "()[]{}"
 输出：true

 输入：s = "([)]"
 输出：false
 
 输入：s = "{[]}"
 输出：true
 链接：https://leetcode-cn.com/problems/valid-parentheses
 */
func isValid(_ s: String) -> Bool {
    let rArr = ["}","]",")"]
    if s.count == 0 || s.count%2 != 0 {
        return false
    }
    if rArr.contains(String(s.first!)) {
        return false
    }
    var push = Array<Character>()
    let dict = ["}":"{", "]":"[", ")":"("]
    for i in s {
        if !rArr.contains(String(i)) {
            push.append(i)
        } else {
            if push.count == 0 {
                return false
            }
            if String(push.last!) == dict[String(i)] {
                push.removeLast()
            } else {
                push.append(i)
            }
        }
    }
    return push.count == 0
}



