use std::collections::HashMap;

pub struct Employee {
    id: i32,
    importance: i32,
    subordinates: Vec<i32>,
}

pub enum IntOrArray {
    Int(i32),
    Array(Vec<i32>),
}

impl Employee {
    pub fn new(id: i32, importance: i32, subordinates: Vec<i32>) -> Self {
        Self {
            id,
            importance,
            subordinates,
        }
    }
    
    pub fn from_vec(vec: &Vec<Vec<IntOrArray>>) -> Vec<Self> {
        let mut result = Vec::new();
        for v in vec {
            match &v[..] {
                [first, second, last] => {
                    if let (IntOrArray::Int(id), IntOrArray::Int(importance), IntOrArray::Array(subordinates)) = (first, second, last) {
                        result.push(Self::new(*id, *importance, subordinates.clone()));
                    }
                },
                _ => todo!()
            }
        }
        result
    }
}

pub fn get_importance(employees: &Vec<Employee>, id: i32) -> i32 {
    let mut map = HashMap::new();
    employees.iter().for_each(|e| {
        map.insert(e.id, e);
    });
    fn dfs(map: &HashMap<i32, &Employee>, id: i32) -> i32 {
        let e = map.get(&id).unwrap();
        let mut result = e.importance;
        e.subordinates.iter().for_each(|sub| {
            result += dfs(map, *sub);
        });
        result
    }
    dfs(&map, id)
}

#[macro_export]
macro_rules! employ_vec {
    (
        $(
            [$id:expr, $importance:expr, [$($sub:expr),*]],
        )*
    ) => {
        {
            let mut outer_vec = Vec::new();
            $(
                let mut inner_vec = Vec::new();
                inner_vec.push(IntOrArray::Int($id));
                inner_vec.push(IntOrArray::Int($importance));
                inner_vec.push(IntOrArray::Array(vec![$($sub),*]));
                outer_vec.push(inner_vec);
            )*
            outer_vec
        }
    };
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_get_importance() {
        let parsed_dsl = employ_vec![
            [1, 5, [2, 3]],
            [2, 3, []],
            [3, 3, []],
        ];
        let employees = Employee::from_vec(&parsed_dsl);
        let result = get_importance(&employees, 1);
        assert_eq!(result, 11);
    }
}