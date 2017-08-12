//
//  SQLiteService.swift
//  TaskForOnlini
//
//  Created by 123 on 07.08.17.
//  Copyright © 2017 taras team. All rights reserved.
//
//
//import Foundation
//import SQLite
//
//class SQLiteService {
//    
//    var database: Connection!
//
//    let tasksTable  = Table("tasks")
//    let id          = Expression<Int>("id")
//    let title       = Expression<String>("title")
//    let description = Expression<String>("description")
//    let date        = Expression<String>("date")
//    let status      = Expression<String>("status")
//    
//    
//    static let shared = SQLiteService()
//    
//    private init () {
//        do {
//            let path = NSSearchPathForDirectoriesInDomains(
//                .documentDirectory, .userDomainMask, true
//                ).first!
//            
//            let database = try Connection("\(path)/db.sqlite3")
//            self.database = database
//        } catch {
//            print(error)
//        }
//        self.createTable()
//    }
//    
//    private func createTable() {
//        let createTable = self.tasksTable.create { (table) in
//            table.column(self.id, primaryKey: true)
//            table.column(self.title)
//            table.column(self.description)
//            table.column(self.date)
//            table.column(self.status)
//        }
//        do {
//            try self.database.run(createTable)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func insertTask(title: String, description: String) {
//        let insertTask = self.tasksTable.insert(self.title <- title, self.description <- description, self.date <- Date().toString(), self.status <- STATUS_ACTIVE)
//        do {
//            try self.database.run(insertTask)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func getTasks() -> [Task] {
//        var tasks = [Task]()
//        do {
//            let tasksFromDatabase = try self.database.prepare(self.tasksTable)
//            for taskFromDatabase in tasksFromDatabase {
//                let id           = taskFromDatabase.get(self.id)
//                let title        = taskFromDatabase.get(self.title)
//                let description  = taskFromDatabase.get(self.description)
//                let date         = taskFromDatabase.get(self.date)
//                let status       = taskFromDatabase.get(self.status)
//                let task         = Task(id: id, title: title, description: description, date: date, status: status)
//                tasks.append(task)
//            }
//            return tasks
//        } catch {
//            print(error)
//        }
//        return tasks
//    }
//    
//    func editTask(id: Int, title: String, description: String) {
//        do {
//            let task = self.tasksTable.filter(self.id == id)
//            let updateTask = task.update(self.title <- title, self.description <- description, self.date <- Date().toString(), self.status <- STATUS_ACTIVE)
//            try self.database.run(updateTask)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func completeTask(id: Int) {
//        let task = self.tasksTable.filter(self.id == id)
//        let completeTask = task.update(self.status <- STATUS_COMPLETED)
//        do {
//            try self.database.run(completeTask)
//        } catch {
//            print(error)
//        }
//    }
//    
//    func deleteTask(id: Int) {
//        let task = self.tasksTable.filter(self.id == id)
//        let deletedTask = task.delete()
//        do {
//            try self.database.run(deletedTask)
//        } catch {
//            print(error)
//        }
//    }
//}

