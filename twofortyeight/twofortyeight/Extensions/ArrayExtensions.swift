import Foundation

extension Array where Iterator.Element == [Int] {
    subscript(row: Int, column: Int) -> Int {
        get {
            return self[row][column]
        }
        set {
            self[row][column] = newValue
        }
    }

    func randomIndex(for value: Int) -> (Int, Int)? {
        indexesWith(value).randomElement()
    }

    private func indexesWith(_ value: Int) -> [(Int, Int)] {
        var indexes:[(Int, Int)] = []

        for row in 0..<count {
            indexes = indexesOf(row, with: value)
        }

        return indexes
    }

    private func indexesOf(_ row: Int, with value: Int)  -> [(Int, Int)] {
        var indexes: [(Int, Int)] = []
        for column in 0..<[row].count {
            if self[row, column] == value {
                indexes.append((row,column))
            }
        }
        return indexes
    }

    var canCombineValues: Bool {
        guard hasZeros == false else { return true }
        for row in 0..<count {
            for column in 0..<[row].count {
                if canCombineItemAt(row: row, column: column) {
                    return true
                }
            }
        }
        return false
    }

    private var hasZeros: Bool {
        joined().contains(0)
    }

    func canCombineItemAt(row: Int, column: Int) -> Bool {
        let verticallyCombinable = canCombineVertically(row: row, column: column)
        let horizontallyCombinable = canCombineHorizontally(row: row, column: column)
        return verticallyCombinable || horizontallyCombinable
    }

    private func canCombineVertically(row: Int, column: Int) -> Bool {
        row != count - 1 && self[row][column] == self[row+1][column]
    }

    private func canCombineHorizontally(row: Int, column: Int) -> Bool {
        column != count - 1 && self[row][column] == self[row][column+1]
    }
}
