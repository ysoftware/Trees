//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by Ерохин Ярослав Игоревич on 04.05.2020.
//  Copyright © 2020 Yaroslav Erokhin. All rights reserved.
//

import XCTest
import BinaryTree

class BinaryTreeTests: XCTestCase {

    func testAddNode() {
        
        let tree = BinarySearchTree<String>()
        tree.add("Hello", key: 5)
        tree.add("World", key: 1)
        tree.add(",", key: 7)
        
        XCTAssertEqual("Hello", tree.rootNode?.value)
        XCTAssertEqual("World", tree.rootNode?.leftBranch?.value)
        XCTAssertEqual(",", tree.rootNode?.rightBranch?.value)
    }
}
