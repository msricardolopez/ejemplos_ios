//
//  List+CoreDataProperties.swift
//  TodoListExample
//
//  Created by Ricardo López on 29/04/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List");
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension List {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: TodoItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: TodoItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
