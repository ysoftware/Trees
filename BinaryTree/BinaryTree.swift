//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Ерохин Ярослав Игоревич on 04.05.2020.
//  Copyright © 2020 Yaroslav Erokhin. All rights reserved.
//

import Foundation

/// https://en.wikipedia.org/wiki/Binary_search_tree

public class BinarySearchTree<Element> {

    public class Node: CustomDebugStringConvertible {
        
        public fileprivate(set) var key: Int
        public fileprivate(set) var value: Element
        public fileprivate(set) var leftBranch: Node?
        public fileprivate(set) var rightBranch: Node?
        
        fileprivate init(_ value: Element, _ key: Int) {
            self.value = value
            self.key = key
        }
        
        public var debugDescription: String {
            "Node: \(value) \(leftBranch != nil ? "<" : "-")\(rightBranch != nil ? ">" : "-")"
        }
    }

    public private(set) var count: Int = 0
    public private(set) var rootNode: Node?
    
    // MARK: - Initialization
    
    public init() { }
}

extension BinarySearchTree: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        let describe: (Node?)->String = { $0.map(String.init(describing:)).map { "(\($0))" } ?? "nil" }
        return "List: count: \(count), root: \(describe(rootNode))"
    }
}

public extension BinarySearchTree {
    
    func add(_ element: Element, key: Int) {
        let node = Node(element, key)
        
        guard var nextNode = rootNode else {
            rootNode = node
            return
        }
        
        while true {
            if nextNode.key == node.key {
                nextNode.value = node.value
            }
            else if node.key < nextNode.key {
                
                guard let leftBranch = nextNode.leftBranch else {
                    nextNode.leftBranch = node
                    return
                }
                nextNode = leftBranch
            }
            else { //  node.key > nextNode.key
                
                guard let rightBranch = nextNode.rightBranch else {
                    nextNode.rightBranch = node
                    return
                }
                nextNode = rightBranch
            }
        }
    }
}
