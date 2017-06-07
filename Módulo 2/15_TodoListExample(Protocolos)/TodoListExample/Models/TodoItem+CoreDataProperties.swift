//
//  TodoItem+CoreDataProperties.swift
//  TodoListExample
//
//  Created by Ricardo López on 29/04/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "TodoItem");
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool
    @NSManaged public var notes: String?
    @NSManaged public var list: List?

}
