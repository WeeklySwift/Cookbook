//: Playground - noun: a place where people can play

import UIKit

//Example of an order structure
struct Order {
    var orderID = 0
    var payments = [Payment]()
}

//Example of a payment structure
struct Payment {
    var amount = 0
    var hasPenalty = false
    var penaltyAmount = 0
}

//List of payments. For simplicity, let's pretend that all orders have the same payments.
let payments = [
    Payment(amount: 1000, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 1234, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 4242, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 54845, hasPenalty: true, penaltyAmount: 900),
    Payment(amount: 1000, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 6258, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 48755, hasPenalty: true, penaltyAmount: 900),
    Payment(amount: 115684, hasPenalty: false, penaltyAmount: 0),
    Payment(amount: 65, hasPenalty: false, penaltyAmount: 0)]

//List of orders that need to be counted
let orders = [
    Order(orderID: 1, payments: payments),
    Order(orderID: 2, payments: payments),
    Order(orderID: 3, payments: payments)]

//First we take out all the `Payment` objects from every order using `flatmap` and pack them into an array
//Then we take out all the amounts from every `Payment` using `map` and pack then into an array
//Then we sum up all the elements using `reduce`
let amountSum   = orders.flatMap{ $0.payments.map{ $0.amount }}.reduce(0){ $0 + $1 }

//We reapeat the proccess for the penalties
let penaltySum  = orders.flatMap{ $0.payments.map{ $0.penaltyAmount } }.reduce(0){ $0 + $1 }

//We sum up all the amounts and the penalties
let totalAmount = amountSum + penaltySum
print(totalAmount)