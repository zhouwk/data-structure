//
//  main.swift
//  二叉排序树
//
//  Created by 周伟克 on 2020/9/14.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

var tree = BiSearchTree(3)
tree.insert(1)
tree.insert(0)
tree.insert(2)
tree.insert(5)
tree.insert(4)
tree.insert(6)
print("---------前序(递归)--------")
tree.preOrderTravelRecursively(node: tree.root!)
print("\n---------前序(栈)--------")
tree.preOrderTravelUsingStack()
print("\n---------中序(递归)--------")
tree.inOrderTravelRecursively(node: tree.root!)
print("\n---------中序(栈)--------")
tree.inOrderTravelUsingStack()

print("\n---------后序--------")
tree.postOrderTravelRecursively(node: tree.root!)
print("\n---------后序(栈)--------")
tree.postOrderTravelUsingStack()


print("\n---------层序遍历(队列)--------")
tree.levelOrderTravelUsingQueue()

print("\n---------树的高度--------")
print(tree.treeHeight)


tree.postOrderTravelUsingStack()


print("\n---------构建新树--------")
tree = BiSearchTree(10)
for nodeValue in [5, 4, 3, 8, 9] {
    tree.insert(nodeValue)
}
print("\n---------删除节点--------")
tree.delete(8)
print("---------前序(递归)--------")
tree.preOrderTravelRecursively(node: tree.root!)
print("\n---------前序(栈)--------")
tree.preOrderTravelUsingStack()
print("\n---------中序(递归)--------")
tree.inOrderTravelRecursively(node: tree.root!)
print("\n---------中序(栈)--------")
tree.inOrderTravelUsingStack()

print("\n---------后序--------")
tree.postOrderTravelRecursively(node: tree.root!)
print("\n---------后序(栈)--------")
tree.postOrderTravelUsingStack()


print("\n---------层序遍历(队列)--------")
tree.levelOrderTravelUsingQueue()
print("\n")







