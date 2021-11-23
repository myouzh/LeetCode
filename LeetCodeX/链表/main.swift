//
//  main.swift
//  链表
//
//  Created by peoly1 on 2021/11/1.
//

import Foundation

// 节点
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    // 封装由数组创建链表方法
    public func creatNode(_ arr:Array<Int>) -> ListNode? {
        if arr.count == 0 {
            return nil
        }
        let listNode = ListNode.init(arr.first!, nil);
        var newListNode = listNode
        for i in 1..<arr.count {
            newListNode.next = ListNode.init(arr[i], nil);
            newListNode = newListNode.next!
        }
        return listNode
    }
    // 打印链表以数组形式展现
    public func printNode(_ listNode:ListNode?) -> Array<Int> {
        if listNode == nil {
            return []
        }
        var arr:Array<Int> = Array()
        var newNode = listNode
        arr.append(newNode!.val)
        while newNode?.next != nil {
            arr.append(newNode!.next!.val)
            newNode = newNode?.next
        }
        return arr
    }
}

class Solution {
     // MARK: - 203.移除链表中的元素
     //https://leetcode-cn.com/problems/remove-linked-list-elements/
     func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let nListNode:ListNode? = ListNode()
        nListNode?.next = head
        var newListNode = nListNode
        while (newListNode?.next != nil) {
            if (newListNode?.next!.val == val) {
                newListNode?.next = newListNode?.next?.next
            } else {
                newListNode = newListNode?.next
            }
        }
        return nListNode?.next
    }
    
     // MARK: - 237. 删除链表中的节点
     /** https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
     node?.val = node?.next?.val ?? 0
     node?.next = node?.next?.next
     */
    func deleteNode(_ node: ListNode?) {
        if (node?.next == nil) { //如果判空
            return
        }
        node?.val = (node?.next!.val)!
        node?.next = node?.next!.next
    }
    
     // MARK: - 206. 反转链表
     // https://leetcode-cn.com/problems/reverse-linked-list/
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        // 递归方式
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    // MARK: - 迭代方式实现反转链表
    func reverseList1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        // 迭代方式  head nextNode next..
        var head = head
        var newHead:ListNode? = nil
        while head != nil {
            let temp = head?.next
            head?.next = newHead
            newHead = head
            head = temp
        }
        return newHead
    }
    
    // MARK: - 判断是否有有环链表 快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}

// 测试
let listNode = ListNode().creatNode([1,3,2,4,2,5])
let listNode2 = ListNode().creatNode([3,2,4,2,5])
let listNode3 = ListNode().creatNode([1,2,3,4,5])
var list = ListNode().printNode(listNode)

let node1 = Solution().removeElements(listNode, 2)
print(ListNode().printNode(node1))
//Solution().deleteNode(listNode2)
let node2 = Solution().reverseList1(listNode3)
print(ListNode().printNode(node2))

//print(String.init(format: "%p", listNode))



