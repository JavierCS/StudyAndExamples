import UIKit

class Node {
    var value: (x: Int, y: Int)
    var roadToThisNode: String
    var children: [Node] = []
    
    init(value: (Int, Int), roadToThisNode: String) {
        self.value = value
        self.roadToThisNode = roadToThisNode
    }
    
    func addChild(_ child: Node) {
        self.children.append(contentsOf: children)
    }
}

func findRoads(for n: Int) -> [String] {
    let startNode = Node(value: (0, 0), roadToThisNode: "")
    addChilds(to: startNode, for: n)
    return completeRoads.map { node -> String in
        return node.roadToThisNode
    }
}

func addChilds(to node: Node, for n: Int) {
    if node.value == (n-1, n-1) {
        completeRoads.append(node)
        return
    }
    if node.value.x < n-1 {
        let rightChild = Node(value: (node.value.x + 1, node.value.y), roadToThisNode: node.roadToThisNode.appending("R"))
        node.addChild(rightChild)
        addChilds(to: rightChild, for: n)
    }
    if node.value.y < n-1 {
        let downChild = Node(value: (node.value.x, node.value.y + 1), roadToThisNode: node.roadToThisNode.appending("D"))
        node.addChild(downChild)
        addChilds(to: downChild, for: n)
    }
}

func printMatrix(for road: String, in n: Int) {
    let positions = obtainPositions(for: road)
    printPositions(positions, in: n)
}

func obtainPositions(for road: String) -> [(x: Int, y: Int)] {
    var auxPosition = (x: 0, y: 0)
    var positions = [(0,0)]
    for element in road {
        if element == "D" {
            auxPosition = (auxPosition.x, auxPosition.y + 1)
        } else if element == "R" {
            auxPosition = (auxPosition.x + 1, auxPosition.y)
        }
        positions.append(auxPosition)
    }
    return positions
}

func printPositions(_ positions: [(x: Int, y: Int)], in n: Int) {
    let emptyRow = Array(repeating: String.Element(" "), count: n)
    var completeMatrix = Array(repeating: emptyRow, count: n)
    for position in positions {
        completeMatrix[position.y][position.x] = "X"
    }
    for row in completeMatrix {
        print(row)
    }
}

var completeRoads: [Node] = []
let n = 3
let start = CFAbsoluteTimeGetCurrent()
let roads = findRoads(for: n)
let diff = CFAbsoluteTimeGetCurrent() - start
let strRoads = roads.count > 500 ? "Son demasiados para pintarlos" : "\(roads)"
print("Tiempo de ejecución: \(diff) segundos")
print("Tienes: \(roads.count) para una matriz de \(n) x \(n):\n\(strRoads)\n\n")

if roads.count < 500 {
    for road in roads {
        print("Camino: \(road):")
        printMatrix(for: road, in: n)
        print("\n")
    }
}


