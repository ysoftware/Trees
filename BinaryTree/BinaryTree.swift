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
        count += 1
        
        let (_existingNode, _parentNode) = findNode(withKey: key)
        
        if let existingNode = _existingNode {
            existingNode.value = element
            return
        }
        
        guard let parentNode = _parentNode else {
            rootNode = node
            return
        }
        
        if parentNode.key < key {
            parentNode.rightBranch = node
        }
        else {
            parentNode.leftBranch = node
        }
    }
    
    func find(key: Int) -> Element? {
        findNode(withKey: key).node?.value
    }
    
    fileprivate func findNode(withKey key: Int) -> (node: Node?, parent: Node?) {
        
        if rootNode == nil {
            return (nil, nil)
        }
        
        var nextNode = rootNode
        var parentNode: Node?
        
        while let _nextNode = nextNode {
            
            if _nextNode.key == key {
                return (nextNode, parentNode)
            }
            
            parentNode = nextNode
            
            if _nextNode.key > key {
                nextNode = _nextNode.leftBranch
            }
            else { //  nextNode.key < key
                nextNode = _nextNode.rightBranch
            }
        }
        
        return (nextNode, parentNode)
    }
}
