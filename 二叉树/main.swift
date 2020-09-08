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


if let root = BiTree().createBiTree(using: treeNodes) {
    print(root.rChild?.rChild?.rChild?.rChild?.value)
}
