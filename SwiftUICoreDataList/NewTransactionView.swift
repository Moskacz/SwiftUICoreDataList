//
//  NewTransactionView.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 08/11/2022.
//

import SwiftUI

struct NewTransactionView: View {
    
    @State
    private var title: String = ""
    
    @State
    private var category: String = ""
    
    @State
    private var amount: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Title:")
                TextField("Tap..", text: $title)
            }
            HStack {
                Text("Category:")
                TextField("Tap..", text: $category)
            }
            HStack {
                Text("Amount")
                TextField("Tap..", text: $amount)
            }
            Button(action: {}, label: {
                Text("Save")
            })
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .lineSpacing(10)
        .background(Color.teal)
    }
}

struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView()
    }
}
