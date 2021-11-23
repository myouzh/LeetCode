//
//  main.swift
//  树
//
//  Created by peoly on 2021/11/18.
//

import Foundation


public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
}


class Solution {
    // MARK: - 104. 二叉树的最大深度
    // https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    
    
    // MARK: - 111 二叉树最小深度
    // https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if (root?.left == nil) && (root?.right == nil) {
            return 1
        }
        var num = Int.max
        if root?.left != nil {
            num = min(minDepth(root?.left), num)
        }
        if root?.right != nil {
            num = min(minDepth(root?.right), num)
        }
        return 1 + num
    }
    
    
    // MARK: - 层序遍历(一维结构)
    // https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var arrquene = [root!]
        var ansArr = [Int]()
        while !arrquene.isEmpty {
            let node = arrquene.removeFirst()
            ansArr.append(node.val)
            arrquene.removeFirst()
            if let nodeLeft = node.left {
                arrquene.append(nodeLeft)
            }
            if let nodeRight = node.right {
                arrquene.append(nodeRight)
            }
        }
        return ansArr
    }
    // 层序遍历(二维结构)https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var quene = [root]
        var ansArr = [[Int]]()
        while !quene.isEmpty {
            let count = quene.count
            var subArr = [Int]()
            for _ in 0..<count {
                let node = quene.removeFirst()
                subArr.append(node.val)
                if node.left != nil {
                    quene.append(node.left!)
                }
                if node.right != nil {
                    quene.append(node.right!)
                }
            }
            ansArr.append(subArr)
        }
        return ansArr
    }
    // MARK: - 中序遍历
    // https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
    var ansArr = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return ansArr
        }
        _ = inorderTraversal(root?.left)
        ansArr.append(root!.val) // 中间打印
        _ = inorderTraversal(root?.right)
        return ansArr
    }
    
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func order(_ root: TreeNode?) {
            guard let root = root else { return }
            order(root.left)
            result.append(root.val)
            order(root.right)
        }
        order(root)
        return result
    }
    
    // MARK: - 226. 翻转二叉树
    // https://leetcode-cn.com/problems/invert-binary-tree/
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var quene = [root]
        while !quene.isEmpty {
            let node = quene.removeFirst()
            let temp = node.left
            node.left = node.right
            node.right = temp
            if node.left != nil {
                quene.append(node.left!)
            }
            if node.right != nil {
                quene.append(node.right!)
            }
        }
        return root
    }
}

// [3,9,20,5,null,15,7,null,null,8]

var root = TreeNode.init(3)
var r1 = TreeNode.init(9)
var r2 = TreeNode.init(20)
root.left = r1
root.right = r2
var r3 = TreeNode.init(5)
root.left?.left = r3
var r4 = TreeNode.init(15)
var r5 = TreeNode.init(7)
root.right?.left = r4
root.right?.right = r5
var r6 = TreeNode.init(8)
root.right?.left?.left = r6

//var minN = Solution().minDepth(root)

var minN = Solution().levelOrder1(root)

var set1:Set = ["a"]
var set = Set<String>()
let suc = set.insert("a").inserted
let suc1 = set.insert("a").inserted

print(minN)
