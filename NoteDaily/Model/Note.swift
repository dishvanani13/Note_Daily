//
//  Note.swift
//  NoteDaily
//
//  Created by Disha Limbani on 2025-01-26.
//
import CoreData

@objc(Note)
class Note: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var preview: String!
    @NSManaged var deletedDate: Date?
}
