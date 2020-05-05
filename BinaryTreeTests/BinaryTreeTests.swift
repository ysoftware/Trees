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
    
    func simpleTree() -> BinarySearchTree<Int> {
        //        5
        //       / \
        //      3   6
        //     /     \
        //    2       8
        //   /       / \
        //  1       7   9
        
        let tree = BinarySearchTree<Int>()
        tree.add(5, key: 5)
        tree.add(3, key: 3)
        tree.add(6, key: 6)
        tree.add(8, key: 8)
        tree.add(9, key: 9)
        tree.add(2, key: 2)
        tree.add(1, key: 1)
        tree.add(7, key: 7)
        return tree
    }
    
    
    // MARK: - Tests
    
    func testAddNodeOrdered() {
        
        let tree = BinarySearchTree<Int>()
        tree.add(0, key: 0)
        tree.add(1, key: 1)
        tree.add(2, key: 2)
        tree.add(3, key: 3)
        tree.add(4, key: 4)
        
        XCTAssertEqual(5, tree.count)
        XCTAssertEqual(tree.rootNode?.value, 0)
        XCTAssertEqual(tree.rootNode?.rightBranch?.value, 1)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.value, 2)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.rightBranch?.value, 3)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.rightBranch?.rightBranch?.value, 4)
    }
    
    func testAddOrderReversed() {
        
        let tree = BinarySearchTree<Int>()
        tree.add(4, key: 4)
        tree.add(3, key: 3)
        tree.add(2, key: 2)
        tree.add(1, key: 1)
        tree.add(0, key: 0)
        
        XCTAssertEqual(5, tree.count)
        XCTAssertEqual(tree.rootNode?.value, 4)
        XCTAssertEqual(tree.rootNode?.leftBranch?.value, 3)
        XCTAssertEqual(tree.rootNode?.leftBranch?.leftBranch?.value, 2)
        XCTAssertEqual(tree.rootNode?.leftBranch?.leftBranch?.leftBranch?.value, 1)
        XCTAssertEqual(tree.rootNode?.leftBranch?.leftBranch?.leftBranch?.leftBranch?.value, 0)
    }
    
    func testAddRandomOrder() {
        let tree = simpleTree()
        
        XCTAssertEqual(8, tree.count)
        XCTAssertEqual(tree.rootNode?.value, 5)
        XCTAssertEqual(tree.rootNode?.leftBranch?.value, 3)
        XCTAssertEqual(tree.rootNode?.leftBranch?.leftBranch?.value, 2)
        XCTAssertEqual(tree.rootNode?.leftBranch?.leftBranch?.leftBranch?.value, 1)
        XCTAssertEqual(tree.rootNode?.rightBranch?.value, 6)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.value, 8)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.leftBranch?.value, 7)
        XCTAssertEqual(tree.rootNode?.rightBranch?.rightBranch?.rightBranch?.value, 9)
    }
    
    func testFind() {
        let tree = simpleTree()
        
        XCTAssertEqual(5, tree.find(key: 5))
        XCTAssertEqual(8, tree.find(key: 8))
        XCTAssertEqual(2, tree.find(key: 2))
        XCTAssertEqual(7, tree.find(key: 7))
        XCTAssertEqual(9, tree.find(key: 9))
    }
}
