// Original code from Quizlet
// Assume the code works perfectly, but is hard to read
//
// Question 1: can you tell me what the code is trying to do?
// Question 2: can you rework the code to be more readable?



//import Foundation
//
//// Example input:
//// print(parse(string: "name-User's first name,age-User's age in years\nallen,10\nbrandon,2"))
///**
// TODO: High level description of the function -- fill me in
// */
//
//func parse(string: String) -> [[String: String]] {
//    var entries = [[String: String]]()
//    //let rows in string.components(separatedBy:"\n")
//    var orderedNames: [String]!
//    var count = 0
//    let rows = string.components(separatedBy:"\n")
//    for row in rows {
//        if count == 0 {
//            orderedNames = names(from: rows[0])
//        }
//        let values = row.components(separatedBy:",")
//        var entry = [String: String]()
//        for i in 0..<values.count { // 0, 1
//            let value = values[i] // "allen"
//            entry[orderedNames[i]] = value
//        }
//        if count > 0 {
//            entries.append(entry)
//        }
//        count = count + 1
//    }
//    return entries
//}
//
///**
// TODO: High level description of this helper function -- fill me in
// */
//
//func names(from string: String) -> [String] {
//    var orderedNames = [String]()
//    for value in string.components(separatedBy:",") {
//        let range = value.range(of: "-")! // test-123
//        let valueWithoutComments = value[..<range.lowerBound] // test
//        orderedNames.append(valueWithoutComments.uppercased())
//    }
//    return orderedNames
//}
//print(parse(string: "name-User's first name,age-User's age in years\nallen,10\nbrandon,2"))

import Foundation

// Example input:
// print(parse(string: "name-User's first name,age-User's age in years\nallen,10\nbrandon,2"))
/**
 TODO: High level description of the function -- fill me in
 */
/*
 Rework suggestions
 1) Change function name from parse to parseStudentRecords
 or
 2) Change parameter string to studentData
 3) Change 'var orderedNames: [String]!'   to  let orderedNames: [String] = names(from: rows[0])
 4) Remove count var
 5) Change for loop control from:  for row in rows {    to    for index in 1...rows.count - 1 {
 6) Add let row = rows[index]
 7) Remove if count == 0 block
 8) Remove count > 0 and count = count + 1
 */

func parse(studentData: String) -> [[String: String]] {
    var entries = [[String: String]]()
    let rows = studentData.components(separatedBy:"\n")
    var orderedNames: [String] = names(from: rows[0])
    for index in 1...rows.count - 1 {
        let row = rows[index]
        let values = row.components(separatedBy:",")
        var entry = [String: String]()
        for i in 0..<values.count { // 0, 1
            let value = values[i] // "allen"
            entry[orderedNames[i]] = value
        }
        entries.append(entry)
    }
    return entries
}

/**
 TODO: High level description of this helper function -- fill me in
 */

func names(from string: String) -> [String] {
    var orderedNames = [String]()
    for value in string.components(separatedBy:",") {
        let range = value.range(of: "-")! // test-123
        let valueWithoutComments = value[..<range.lowerBound] // test
        orderedNames.append(valueWithoutComments.uppercased())
    }
    return orderedNames
}
print(parse(studentData: "name-User's first name,age-User's age in years\nallen,10\nbrandon,2"))
