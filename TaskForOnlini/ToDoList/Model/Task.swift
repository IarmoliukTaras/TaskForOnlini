//
//  Task.swift
//  TaskForOnlini
//
//  Created by 123 on 08.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation

let STATUS_ACTIVE = "active"
let STATUS_COMPLETED = "completed"

struct Task {
    let id: Int
    let title: String
    let description: String
    let date: String
    let status: String
}
