//
//  main.swift
//  二叉树
//
//  Created by 周伟克 on 2020/9/7.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation


let EOT = "#"
var treeNodes = ["0", "1", "3", EOT, EOT, "4", EOT, "7", EOT, EOT, "2",
                 "5", EOT, EOT, "6", EOT, "10", "11", EOT, "13", EOT, EOT, "12",
                 EOT, EOT]


var root = Node(treeNodes[0])
var tempRoot = root
var index = 0
var value = ""


/// 入口(先序遍历)
func createBiTree(using values: [String]) -> Node? {
    if values.count == 0 {
        return nil
    }
    let root = Node(values[0])
    var index = 0
    createNodeChildren(root: root) { () -> Node? in
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
func createNodeChildren(root: Node, next: () -> Node?) {
    if let lChild = next() {
        root.lChild = lChild
        createNodeChildren(root: lChild, next: next)
    }
    if let rChild = next() {
        root.rChild = rChild
        createNodeChildren(root: rChild, next: next)
    }
}

//createBiTree(root: tempRoot)




if let root = createBiTree(using: treeNodes) {
    print(root.rChild?.rChild?.rChild?.lChild?.rChild?.value)
}
