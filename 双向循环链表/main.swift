//
//  main.swift
//  双向循环链表
//
//  Created by 周伟克 on 2020/8/28.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation



var list = LinkedList<Int>()
print("----------append------------")
list.append(0)
list.append(1)
list.append(2)
list.append(3)
list.append(4)

print("----------头尾节点遍历------------")
list.travelFromHead()
list.travelFromTail()


print("----------反转------------")
list.reverse()
list.travelFromHead()
list.travelFromTail()


print("----------insert------------")
list.clear()
list.insert(0, at: 0) // 0
list.insert(1, at: 1) // 0 1
list.insert(2, at: 0) // 2 0 1
list.insert(3, at: 1) // 2 3 0 1
list.insert(100, at: 4) // 2 3 0 1 100


list.travelFromHead()
list.travelFromTail()

print("----------delete------------")
list.deleteNode(at: 2) // 2 3 1 100
list.deleteNode(at: 0) // 3 1 100
list.deleteNode(at: 2) // 3 1
list.deleteNode(at: 1) // 3
list.deleteNode(at: 0)

list.travelFromHead()
list.travelFromTail()





// 想要打开 jd， false  web
