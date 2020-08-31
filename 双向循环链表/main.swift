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





// 想要打开 jd， false  web
