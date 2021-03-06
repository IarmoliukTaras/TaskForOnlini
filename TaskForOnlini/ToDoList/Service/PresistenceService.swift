//
//  PresistenceService.swift
//  TaskForOnlini
//
//  Created by 123 on 12.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//

import Foundation
import CoreData

class PresistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    static func addTask(title: String, about: String) {
        let task = Task(context: context)
        task.title = title
        task.about = about
        task.status = STATUS_ACTIVE
        task.date = Date().toString()
        saveContext()
    }
    
    static func getTasks() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let tasks = try context.fetch(fetchRequest)
            return tasks
        } catch {
            print(error)
        }
        return [Task]()
    }
    
    static func delete(task: Task) {
        context.delete(task)
        saveContext()
    }
    
    
    
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TaskForOnlini")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy"
        return dateFormatter.string(from: self)
    }
}
