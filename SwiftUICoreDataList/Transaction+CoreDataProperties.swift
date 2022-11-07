//
//  Transaction+CoreDataProperties.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 07/11/2022.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged private var cd_title: String?
    @NSManaged private var cd_category: String?
    @NSManaged private var cd_identifier: UUID?
    @NSManaged private var cd_timestamp: Date?
    @NSManaged private var cd_amount: NSDecimalNumber?
    
    var title: String { cd_title! }
    var category: String { cd_category! }
    var identifier: UUID { cd_identifier! }
    var timestamp: Date { cd_timestamp! }
    var amount: Decimal{ cd_amount! as Decimal }
}

extension Transaction {
    static let timestampSortDescriptor = NSSortDescriptor(keyPath: \Transaction.cd_timestamp, ascending: false)
    
    @discardableResult
    static func insert(into managedObjectContext: NSManagedObjectContext,
                       identifier: UUID,
                       title: String,
                       category: String,
                       timestamp: Date,
                       amount: Decimal) -> Transaction {
        let entity = Transaction(context: managedObjectContext)
        entity.cd_identifier = identifier
        entity.cd_title = title
        entity.cd_category = category
        entity.cd_timestamp = timestamp
        entity.cd_amount = amount as NSDecimalNumber
        
        return entity
    }
}

extension Transaction : Identifiable {}
