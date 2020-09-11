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
//
//treeNodes = ["0", "1", "3", EOT, EOT, "4", "5", "7", EOT, EOT, "8", EOT, EOT,
//             "6", EOT, EOT, "2", "9", EOT, EOT, "10", EOT, "12", EOT, EOT,]


//treeNodes = ["0", "1", "3", "7", EOT, EOT, "8", "9", EOT, EOT, "10", EOT, "11",
//             EOT, EOT, "4", EOT, EOT, "2", "5", EOT, EOT, "6", "12", "14", "15",
//             EOT, EOT, EOT, EOT, "13", EOT, EOT]
//treeNodes = ["0", EOT, "1", EOT, "2", EOT, "3", EOT, EOT, ]
//treeNodes = ["0", "1", "2", "3", EOT, EOT, EOT, EOT, EOT]


let tree = BiTree()
if let root = tree.createBiTree(using: treeNodes) {
    print("---------前序(递归)--------")
    tree.preOrderTravelRecursively(node: root)
    print("\n---------前序(栈)--------")
    tree.preOrderTravelUsingStack()
    print("\n---------中序(递归)--------")
    tree.inOrderTravelRecursively(node: root)
    print("\n---------中序(栈)--------")
    tree.inOrderTravelUsingStack()

    print("\n---------后序--------")
    tree.postOrderTravelRecursively(node: root)
    print("\n---------后序(栈)--------")
    tree.postOrderTravelUsingStack()
    

    print("\n---------层序遍历(队列)--------")
    tree.levelOrderTravelUsingQueue()
    
    print("\n---------树的高度--------")
    print(tree.treeHeight)

    


}
