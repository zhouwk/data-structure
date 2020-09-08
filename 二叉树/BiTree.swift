//
//  BiTree.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/8.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


class BiTree {
    
    /// 入口(先序遍历)
    func createBiTree(using values: [String]) -> Node? {
        if values.count == 0 {
            return nil
        }
        let root = Node(values[0])
        var index = 0
        createChildren(for: root) { () -> Node? in
            // 该闭包的功能：累加index，遍历values
           // 如果index == values.count，则遍历结束，则不会创建新节点
           // 如果values[index] == EOF，则表明正在遍历的节点没有对应位置的子节点，至于具体位置，则取决于createNodeChildren中是left调用的，还是right调用的
           index += 1
           if index >= values.count {
               return nil
           }
           let value = values[index]
           if value == EOT {
               return nil
           }
           return Node(value)
        }
        return root
    }

    /// 创建节点的children
    ///
    /// - Parameter node: 当前正在遍历的节点，也是为该节点创建左右子节点
    /// - Parameter next: 闭包调用接收新的节点，新的节点将作为node的左或右子节点
    private func createChildren(for node: Node, next: () -> Node?) {
        if let lChild = next() {
            node.lChild = lChild
            createChildren(for: lChild, next: next)
        }
        if let rChild = next() {
            node.rChild = rChild
            createChildren(for: rChild, next: next)
        }
    }

}
