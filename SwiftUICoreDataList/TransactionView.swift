//
//  TransactionView.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 07/11/2022.
//

import SwiftUI

struct TransactionView: View {
    let title: String
    let category: String
    let timestamp: String
    
    
    var body: some View {
        VStack {
            Text("Title: \(title)")
            Text("Category: \(category)")
            Text("Timestamp: \(timestamp)")
        }
    }
}
