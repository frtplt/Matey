//
//  CoreDataManager.swift
//  PersistentTodoList
//
//  Created by Alok Upadhyay on 30/03/2018.
//  Copyright © 2017 Alok Upadhyay. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol CoreDataManagerInterface: AnyObject {
  func saveContext()
  func insertPerson(name: String, friend: String, lend: String, borrow: String, username: String) -> Person?
  func update(name: String, friend: String, lend: String, borrow: String, username: String, person: Person)
  func delete(person: Person)
}

class CoreDataManager: CoreDataManagerInterface {

   var persistentContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "Matey")
    
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  func saveContext () {
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

  func insertPerson(name: String, friend: String, lend: String, borrow: String, username: String) -> Person? {

    let managedContext = persistentContainer.viewContext

    let entity = NSEntityDescription.entity(forEntityName: "Person",
                                            in: managedContext)!

    let person = NSManagedObject(entity: entity,
                                 insertInto: managedContext)

    person.setValue(name, forKeyPath: "name")
    person.setValue(friend, forKeyPath: "friend")
    person.setValue(lend, forKeyPath: "lend")
    person.setValue(borrow, forKeyPath: "borrow")
    person.setValue(username, forKeyPath: "username")

    //  You commit your changes to person and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block.

    do {
      try managedContext.save()
      return person as? Person
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
      return nil
    }
  }
  
  func update(name: String, friend: String, lend: String, borrow: String, username: String, person: Person) {

    let context = persistentContainer.viewContext
    
    do {
      person.setValue(name, forKeyPath: "name")
      person.setValue(friend, forKeyPath: "friend")
      person.setValue(lend, forKeyPath: "lend")
      person.setValue(borrow, forKeyPath: "borrow")
      person.setValue(username, forKeyPath: "username")
      /*
       You commit your changes to person and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block. Finally, insert the new managed object into the people array so it shows up when the table view reloads.
       */
      do {
        try context.save()
        print("saved!")
      } catch let error as NSError  {
        print("Could not save \(error), \(error.userInfo)")
      } catch {
        
      }
      
    } catch {
      print("Error with request: \(error)")
    }
  }
  
  /*delete*/
  func delete(person: Person) {
    
    let managedContext = persistentContainer.viewContext
    
    do {
      managedContext.delete(person)
    } catch {
      // Do something in response to error condition
      print(error)
    }
    do {
      try managedContext.save()
    } catch {
      // Do something in response to error condition
    }
  }
  
  func fetchCurrentPerson(username: String) -> [Person]?{
    /*Before you can do anything with Core Data, you need a managed object context. */
    let managedContext = persistentContainer.viewContext
    
    /*As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data.
     
     Initializing a fetch request with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Person entities.
     */
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
    fetchRequest.predicate = NSPredicate(format: "username == %@" ,username as CVarArg)
    
    /*You hand the fetch request over to the managed object context to do the heavy lifting. fetch(_:) returns an array of managed objects meeting the criteria specified by the fetch request.*/
    do {
      let people = try managedContext.fetch(fetchRequest)
      return people as? [Person]
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      return nil
    }
  }
  
    func delete(username: String) -> [Person]? {
    /*get reference to appdelegate file*/
      
    /*get reference of managed object context*/
    let managedContext = persistentContainer.viewContext
    
    /*init fetch request*/
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
    
    /*pass your condition with NSPredicate. We only want to delete those records which match our condition*/
    fetchRequest.predicate = NSPredicate(format: "username == %@" ,username as CVarArg)
    do {
      
      /*managedContext.fetch(fetchRequest) will return array of person objects [personObjects]*/
      let item = try managedContext.fetch(fetchRequest)
      var arrRemovedPeople = [Person]()
      for person in item {
        
        /*call delete method(aManagedObjectInstance)*/
        /*here i is managed object instance*/
        managedContext.delete(person)
        
        /*finally save the contexts*/
        try managedContext.save()
        
        /*update your array also*/
        arrRemovedPeople.append(person as? Person ?? Person())
      }
      return arrRemovedPeople
      
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
      return nil
    }
  }
}
