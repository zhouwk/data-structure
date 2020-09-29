//
//  BiSearchTree.swift
//  二叉排序树
//
//  Created by 周伟克 on 2020/9/14.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


class BiSearchTree<T: Comparable> {
    
    var root: Node<T>?
    
    init(_ value: T) {
        self.root = Node(value)
    }
    
    /// 插入节点
    func insert(_ value: T) {
        let newNode = Node(value)
        var cursor = root
        while true {
            if value == cursor!.value {
                cursor!.value = value
                return
            }
            if value > cursor!.value {
                if cursor!.rChild != nil {
                    cursor = cursor!.rChild
                } else {
                    cursor!.rChild = newNode
                    return
                }
            } else if cursor!.lChild != nil {
                cursor = cursor!.lChild
            } else {
                cursor!.lChild = newNode
                return
            }
        }
    }
    
    
    /// 删除节点(详细笔记可见？？)
    ///
    /// - Parameter value: 待删除节点的值
    func delete(_ value: T) {
        // 1. 确定目标节点的节点信息
        let targetInfo = locateValue(value)
        guard let target = targetInfo.target else {
            print("不存在value = \(value)的节点")
            return
        }
        let parent = targetInfo.parent
        // 2. 删除逻辑
        if target.childCount == 2 {
            // 需要找到target的直接后继和直接后继的父节点
            var successor = target.rChild
            var successorParent = target
            while successor!.lChild != nil {
                successorParent = successor!
                successor = successor!.lChild
            }
            target.value = successor!.value
            let successorChild = successor?.lChild ?? successor?.rChild
            if successor === successorParent.lChild {
                successorParent.lChild = successorChild
            } else {
                successorParent.rChild = successorChild
            }
        } else {
            // target的度为0或者1
            let child = target.lChild ?? target.rChild
            if target === root {
                root = child
            } else if target === parent?.lChild {
                parent?.lChild = child
            } else {
                parent?.rChild = child
            }
        }
    }
    
    
    /// 定位值为value的节点
    func locateValue(_ value: T) -> (target: Node<T>?, parent: Node<T>?) {
        var cursor = root
        var parent: Node<T>?
        while cursor != nil {
            if cursor!.value == value {
                break
            }
            parent = cursor
            if cursor!.value > value {
                cursor = cursor?.lChild
            } else {
                cursor = cursor?.rChild
            }
        }
        return (cursor, cursor == nil ? nil : parent)
    }
    
    /// 递归前序遍历
    func preOrderTravelRecursively(node: Node<T>) {
        print(node.value, terminator: terminator)
        if let lChild = node.lChild {
            preOrderTravelRecursively(node: lChild)
        }
        if let rChild = node.rChild {
            preOrderTravelRecursively(node: rChild)
        }
    }
    /// 递归中序遍历
    func inOrderTravelRecursively(node: Node<T>) {
        if let lChild = node.lChild {
            inOrderTravelRecursively(node: lChild)
        }
        print(node.value, terminator: terminator)
        if let rChild = node.rChild {
            inOrderTravelRecursively(node: rChild)
        }
    }
    /// 递归后序遍历
    func postOrderTravelRecursively(node: Node<T>) {
        if let lChild = node.lChild {
            postOrderTravelRecursively(node: lChild)
        }
        if let rChild = node.rChild {
            postOrderTravelRecursively(node: rChild)
        }
        print(node.value, terminator: terminator)
    }
    
    /// 使用栈进行前序遍历
    func preOrderTravelUsingStack() {
        let stack = Stack<Node<T>>()
        var cursor: Node? = root
        while cursor != nil || !stack.isEmpty {
            if cursor != nil {
                print(cursor!.value, terminator: terminator)
                stack.push(cursor!)
                cursor = cursor?.lChild
            } else {
                cursor = stack.pop()?.rChild
            }
        }
    }
    
    /// 使用栈进行中序遍历
    func inOrderTravelUsingStack() {
        let stack = Stack<Node<T>>()
        var cursor = root
        while cursor != nil || !stack.isEmpty {
            if cursor != nil {
                stack.push(cursor!)
                cursor = cursor?.lChild
            } else {
                print(stack.top!.value, terminator: terminator)
                cursor = stack.pop()?.rChild
            }
        }
    }
    
    /// 使用栈进行后序遍历
    func postOrderTravelUsingStack() {
//        guard let root = root else { return }
    }
    
    
    /// 层序遍历(使用队列)
    func levelOrderTravelUsingQueue() {
        guard let root = root else {
            return
        }
        let queue = Queue<Node<T>>()
        queue.enQueue(root)
        while queue.head != nil {
            print(queue.head!.value, terminator: terminator)
            if queue.head!.lChild != nil {
                queue.enQueue(queue.head!.lChild!)
            }
            if queue.head!.rChild != nil {
                queue.enQueue(queue.head!.rChild!)
            }
            _ = queue.deQueue()
        }
    }
    
    /// 是否是二叉排序树
    func isBiSearchTree() -> Bool {
        guard let root = root else {
            return true
        }
        let queue = Queue<Node<T>>()
        queue.enQueue(root)
        while queue.head != nil {
            if queue.head!.lChild != nil {
                if queue.head!.value <=  queue.head!.lChild!.value {
                    return false
                }
                queue.enQueue(queue.head!.lChild!)
            }
            if queue.head!.rChild != nil {
                if queue.head!.value >=  queue.head!.rChild!.value {
                    return false
                }
                queue.enQueue(queue.head!.rChild!)
            }
            _ = queue.deQueue()
        }
        return true
    }
    
    let terminator = "   "
    
    
    // 树高度
    var treeHeight: Int { nodeHeight(node: root) }
    
    // 节点高度
    private func nodeHeight(node: Node<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        return max(nodeHeight(node: node.lChild),
                   nodeHeight(node: node.rChild)) + 1
    }
    
    
    // 反转(树的反转是指树中所有节点的左右子节点交换位置)
    func reverse(node: Node<T>?) {
        guard let node = node else { return }
        (node.lChild, node.rChild) = (node.rChild, node.lChild)
        reverse(node: node.lChild)
        reverse(node: node.rChild)
    }
}
