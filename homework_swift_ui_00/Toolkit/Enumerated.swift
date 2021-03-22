//
//  Enumerated.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 22.03.2021.
//

import Foundation

func enumerate<T>(_ array: Array<T>) -> [(index: Int, item: T)] { Array(zip(array.indices, array)) }
