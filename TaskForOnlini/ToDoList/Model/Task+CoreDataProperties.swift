//
//  Task+CoreDataProperties.swift
//  TaskForOnlini
//
//  Created by 123 on 12.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var title: String?
    @NSManaged public var about: String?
    @NSManaged public var date: String?
    @NSManaged public var status: String?

}
