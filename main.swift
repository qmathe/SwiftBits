//
//  main.swift
//  SwiftBits
//
//  Created by Quentin Mathé on 15/07/2014.
//  Copyright (c) 2014 Quentin Mathé. All rights reserved.
//

import Foundation

println("Hello, World!")

let numbers = [4, 6, 9, 10]
let value = 9;

println("Found: \(binarySearch(numbers, value))")
println("Found: \(binarySearchInRangeIterative(numbers, value, 0, numbers.count))")