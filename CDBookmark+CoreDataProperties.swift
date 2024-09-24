//
//  CDBookmark+CoreDataProperties.swift
//  NewsApp
//
//  Created by Ariven on 15/09/24.
//
//

import Foundation
import CoreData

extension CDBookmark {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBookmark> {
        return NSFetchRequest<CDBookmark>(entityName: "CDBookmark")
    }

    @NSManaged public var bookmarkId: String?
}

extension CDBookmark : Identifiable {

}
