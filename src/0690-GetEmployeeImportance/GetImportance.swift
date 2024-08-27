public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
    static func from(_ arr: [[Any]]) -> [Employee] {
        var employees = [Employee]()
        for i in 0..<arr.count {
            let ele = arr[i]
            if let id = ele[0] as? Int, let importance = ele[1] as? Int, let subordinates = ele[2] as? [Int] {
                let emp = Employee(id, importance, subordinates)
                employees.append(emp)
            }
        }
        return employees
    }
}

func getImportanceV2(_ employees: [Employee], _ id: Int) -> Int {
    var map: [Int: Employee] = [:]
    employees.forEach { map[$0.id] = $0 }
    
    
    func _dfs(_ id: Int) -> Int {
        var res = 0
        if let employee = map[id] {
            res += employee.importance
            employee.subordinates.forEach { res += _dfs($0) }
        }
        return res
    }
    
    return _dfs(id)
}

func getImportance(_ employees: [Employee], _ id: Int) -> Int {
    var res = 0;
    dfs(employees, [id], &res)
    return res
}

func dfs(_ employees:[Employee], _ ids: [Int], _ importance: inout Int) {
    if ids.count == 0 {
        return
    }

    for epl in employees {
        if ids.contains(epl.id) {
            importance += epl.importance
            dfs(employees, epl.subordinates, &importance)
        }
    }
}

print(getImportance(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1))
print(getImportanceV2(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1))