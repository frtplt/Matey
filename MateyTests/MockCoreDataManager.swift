//
//  MockCoreDataManager.swift
//  MateyTests
//
//  Created by Firat Polat on 6.10.2022.
//

import CoreData
@testable import Matey

final class MockCoreDataManager: CoreDataManagerInterface {

    var invokedPersistentContainerGetter = false
    var invokedPersistentContainerGetterCount = 0
    var stubbedPersistentContainer: NSPersistentContainer!

    var persistentContainer: NSPersistentContainer {
        invokedPersistentContainerGetter = true
        invokedPersistentContainerGetterCount += 1
        return stubbedPersistentContainer
    }

    var invokedSaveContext = false
    var invokedSaveContextCount = 0

    func saveContext() {
        invokedSaveContext = true
        invokedSaveContextCount += 1
    }

    var invokedInsertPerson = false
    var invokedInsertPersonCount = 0
    var invokedInsertPersonParameters: (name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID)?
    var invokedInsertPersonParametersList = [(name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID)]()
    var stubbedInsertPersonResult: Person!

    func insertPerson(name: String, friend: String, lend: Double, borrow: Double, username: String, id: UUID) -> Person? {
        invokedInsertPerson = true
        invokedInsertPersonCount += 1
        invokedInsertPersonParameters = (name, friend, lend, borrow, username, id)
        invokedInsertPersonParametersList.append((name, friend, lend, borrow, username, id))
        return stubbedInsertPersonResult
    }

    var invokedUpdate = false
    var invokedUpdateCount = 0
    var invokedUpdateParameters: (name: String, friend: String, lend: String, borrow: String, username: String, id: UUID, person: Person)?
    var invokedUpdateParametersList = [(name: String, friend: String, lend: String, borrow: String, username: String, id: UUID, person: Person)]()

    func update(name: String, friend: String, lend: String, borrow: String, username: String, id: UUID, person: Person) {
        invokedUpdate = true
        invokedUpdateCount += 1
        invokedUpdateParameters = (name, friend, lend, borrow, username, id, person)
        invokedUpdateParametersList.append((name, friend, lend, borrow, username, id, person))
    }

    var invokedFetchCurrentPerson = false
    var invokedFetchCurrentPersonCount = 0
    var invokedFetchCurrentPersonParameters: (username: String, Void)?
    var invokedFetchCurrentPersonParametersList = [(username: String, Void)]()
    var stubbedFetchCurrentPersonResult: [Person]!

    func fetchCurrentPerson(username: String) -> [Person]? {
        invokedFetchCurrentPerson = true
        invokedFetchCurrentPersonCount += 1
        invokedFetchCurrentPersonParameters = (username, ())
        invokedFetchCurrentPersonParametersList.append((username, ()))
        return stubbedFetchCurrentPersonResult
    }

    var invokedDelete = false
    var invokedDeleteCount = 0
    var invokedDeleteParameters: (id: UUID, Void)?
    var invokedDeleteParametersList = [(id: UUID, Void)]()
    var stubbedDeleteResult: [Person]!

    func delete(id: UUID) -> [Person]? {
        invokedDelete = true
        invokedDeleteCount += 1
        invokedDeleteParameters = (id, ())
        invokedDeleteParametersList.append((id, ()))
        return stubbedDeleteResult
    }

    var invokedDeleteAllRecords = false
    var invokedDeleteAllRecordsCount = 0
    var invokedDeleteAllRecordsParameters: (entity: String, Void)?
    var invokedDeleteAllRecordsParametersList = [(entity: String, Void)]()

    func deleteAllRecords(entity : String) {
        invokedDeleteAllRecords = true
        invokedDeleteAllRecordsCount += 1
        invokedDeleteAllRecordsParameters = (entity, ())
        invokedDeleteAllRecordsParametersList.append((entity, ()))
    }
}
