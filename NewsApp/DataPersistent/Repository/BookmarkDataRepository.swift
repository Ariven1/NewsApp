//
//  BookmarkDataRepository.swift
//  NewsApp
//
//  Created by Ariven on 15/09/24.
//

import CoreData

protocol BookmarkRepository {
    func create(bookmarkId: String)
    func isBookmarked(bookmarkId: String) -> Bool
    func delete(bookmarkId: String) -> Bool
}

struct BookmarkDataRepository: BookmarkRepository
{
    func create(bookmarkId: String) {
        let cdBookmark = CDBookmark(context: PersistentStorage.shared.context)
        cdBookmark.bookmarkId = bookmarkId
        PersistentStorage.shared.saveContext()
    }

    func isBookmarked(bookmarkId: String) -> Bool {
        var bookmarked = false
        if let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDBookmark.self) {
            bookmarked = result.contains { $0.bookmarkId == bookmarkId }
        }
        return bookmarked
    }

    func delete(bookmarkId: String) -> Bool {

        let cdBookmark = getCDBookmark(byIdentifier: bookmarkId)
        guard cdBookmark != nil else {return false}
        PersistentStorage.shared.context.delete(cdBookmark!)
        PersistentStorage.shared.saveContext()
        return true
    }

    private func getCDBookmark(byIdentifier id: String) -> CDBookmark? {
        let fetchRequest = NSFetchRequest<CDBookmark>(entityName: EntityName.cdBookmark)
        let predicate = NSPredicate(format: "bookmarkId==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
