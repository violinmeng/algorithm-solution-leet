open class Employee {
    open var id: Int
    open var importance: Int
    open var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }

    public static func from(_ arr: [[Any]]) -> [Employee] {
        var employees = [Employee]()
        for idx in 0 ..< arr.count {
            let ele = arr[idx]
            if let id = ele[0] as? Int, let importance = ele[1] as? Int, let subordinates = ele[2] as? [Int] {
                let emp = Employee(id, importance, subordinates)
                employees.append(emp)
            }
        }
        return employees
    }
}

public func getImportanceV2(_ employees: [Employee], _ id: Int) -> Int {
    var map: [Int: Employee] = [:]
    employees.forEach { map[$0.id] = $0 }
    func innerDfs(_ id: Int) -> Int {
        var res = 0
        if let employee = map[id] {
            res += employee.importance
            employee.subordinates.forEach { res += innerDfs($0) }
        }
        return res
    }
    return innerDfs(id)
}

public func getImportance(_ employees: [Employee], _ id: Int) -> Int {
    var res = 0
    dfs(employees, [id], &res)
    return res
}

func dfs(_ employees: [Employee], _ ids: [Int], _ importance: inout Int) {
    if ids.count == 0 {
        return
    }
    for epl in employees where ids.contains(epl.id) {
        importance += epl.importance
        dfs(employees, epl.subordinates, &importance)
    }
}
