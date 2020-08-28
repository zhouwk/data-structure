//
//  main.swift
//  双向链表
//
//  Created by 周伟克 on 2020/8/27.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

print("Hello, World!")

// 为了避免循环引用，pre节点weak修饰

// 插入（index， newNode） ： 除了正常的节点插入之后，临界值判断，如果index的pre为nil，需要设置首节点newNode，又 如果index的next为nil需要设置尾结点newNode. （两个if判断不是if else 关系， 而是  并列关系）


// 删除节点  first last的考虑 如上


// 如果通过index 确定 node ，可以先判断index 和size * 0。5 的关系决定从first还是last 开始
// 如果是找某个value的node，可以头尾同时进行


var list = LinkedList<Int>()
print("--------末尾追加----------")
list.append(0)
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.travelFromHead()
list.travelFromTail()


print("--------clear----------")
list.clear()



print("--------任意位置插入----------")
list = LinkedList<Int>()
list.insert(0, at: 0) // 0
list.insert(1, at: 0) // 1 0
list.insert(2, at: 2) // 1 0 2
list.insert(3, at: 1) // 1 3 0 2
list.travelFromHead()
list.travelFromTail()


print("--------删除指定位置节点----------")
list = LinkedList<Int>()
list.append(0)
list.append(1)
list.append(2)
list.append(3)

list.deleteNode(at: 0) // 1 2 3
list.deleteNode(at: 2) // 1 2
list.deleteNode(at: 1) // 1
list.deleteNode(at: 0) // empty
list.travelFromHead() //
list.travelFromTail()


print("--------反转----------")
list = LinkedList<Int>()
list.append(0)
list.append(1)
list.append(2)
list.append(3)
list.append(4)
print("--------before 反转----------")
list.travelFromHead() //
list.travelFromTail()
list.reverse()
print("--------after 反转----------")
list.travelFromHead() //
list.travelFromTail()


