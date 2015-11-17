//: Playground - noun: a place where people can play

import UIKit

//Example of a User structure
struct User {
    var name: String?
    var surname: String?
    var age: Int?
}

//list of users we need to introduce. Notice that the list contains .None and nil
let users: [User?] = [User(name: "Peter", surname: "Jackson", age: 42),
    User(name: "Emma", surname: .None, age: .None),
    User(name: "Bob", surname: "Smith", age: nil),
    .None,
    User(name: "Daniel", surname: nil, age: 27),
    User(name: .None, surname: nil, age: 30),
    nil,
    User(name: "Robert", surname: "Banks", age: 28)
]

// a function to get the user's name
func getNameForUser(optUser: User?) -> String {
    //as optUser is an optional and can be nil we first need to check that it's not
    //we make a user property and assign it the optUser object
    //at this point if optUser is nil then block get's executed and the function returns an empty string
    guard let user = optUser else { return "" }
    
    //here we already know that the user is no nil
    //now we check if the name property is nil
    guard let name = user.name else { return "" }
    
    //here we have sucessfully retreived the name of the user and can return it
    return name
}

// a function to get the user's surname
func getSurnameForUser(optUser: User?) -> String {
    //we can use optional chainging in swift and check the surname directly
    //the functions will return an empty string if the user is nil or if the surname is nil
    guard let surname = optUser?.surname else { return "" }
    return surname
}

// a handy function to get the user's full name
func getFullNameForUser(optUser: User?) -> String {
    guard let name = optUser?.name else { return "Anonymous" }
    guard let surname = optUser?.surname else { return name }
    return name + " " + surname
}

//a function to get the user's age
func getAgeForUser(optUser: User?) -> String {
    guard let age = optUser?.age else { return "" }
    return "\(age)"
}

// a function to construct the full info about the user
func getInfoForUser(optUser: User?) -> String {
    guard let user = optUser else { return "" }
    
    //here we construct the sentence that we want to print out
    var resultStr = "Hi! My name is \(getFullNameForUser(user))"
    
    let age = getAgeForUser(user)
    resultStr += age.isEmpty ? "" : ". I'm \(age) years old"
    return resultStr
}

//here we introduce the users
func introduceUsers() {
    for user in users {
        print(getInfoForUser(user))
    }
}

introduceUsers()

//but we can see blank lines. We don't want those space and we get rid of them

print("===========")

//here we introduce only the users that are not nil
func introduceUsersWithoutNils() {
    for user in users {
        let info = getInfoForUser(user)
        if info.isEmpty { continue }
        print(getInfoForUser(user))
    }
}

introduceUsersWithoutNils()

//looks ok. But why use a good' old for loop when we can unleash the power of Swift!

print("===========")

//how fancy is that, huh? 😎
func introduceUsersWithoutNilsTheFancyWay() {
    users.flatMap{$0}.forEach{ print(getInfoForUser($0)) }
    //flatmap strips the nils from the array automatically
}

introduceUsersWithoutNilsTheFancyWay()
