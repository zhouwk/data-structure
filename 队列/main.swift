//
//  main.swift
//  队列
//
//  Created by 周伟克 on 2020/9/1.
//  Copyright © 2020 周伟克. All rights reserved.
//

import Foundation

print("Hello, World!")


let queue = Queue<Int>()
queue.enQueue(0)
queue.enQueue(1)
queue.enQueue(2)
queue.enQueue(3)



print(queue.deQueue())
print(queue.deQueue())
print(queue.deQueue())
print(queue.deQueue())
print(queue.deQueue())



queue.enQueue(5)
print("head", queue.head?.value)
print("tail", queue.tail?.value)



