//: Playground - noun: a place where people can play

import UIKit

var font: UIFont

if #available(iOS 8.2, *) {
    font = UIFont.systemFontOfSize(20, weight: UIFontWeightLight)
} else {
    font = UIFont(name: "HelveticaNeue-Light", size: 20)!
}