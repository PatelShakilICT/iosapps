//
//  Student+CoreDataProperties.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var course: Course?

}

extension Student : Identifiable {

}
