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

    @NSManaged public var cd_title: String?
    @NSManaged public var cd_category: String?
    @NSManaged public var cd_identifier: UUID?
    @NSManaged public var cd_timestamp: Date?
    @NSManaged public var cd_amount: NSDecimalNumber?

}

extension Transaction : Identifiable {

}
