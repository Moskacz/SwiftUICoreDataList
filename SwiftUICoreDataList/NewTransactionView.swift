//
//  NewTransactionView.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 08/11/2022.
//

import SwiftUI

struct NewTransactionView: View {
    
    @Binding
    var sheetPresented: Bool
    
    @StateObject var viewModel: NewTransactionViewModel
    
    init(sheetPresented: Binding<Bool>, viewModel: NewTransactionViewModel = NewTransactionViewModel()) {
        self._sheetPresented = sheetPresented
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Title:")
                TextField("Tap..", text: $viewModel.title)
            }
            HStack {
                Text("Category:")
                TextField("Tap..", text: $viewModel.category)
            }
            HStack {
                Text("Amount")
                TextField("Tap..", text: $viewModel.amount)
            }
            Button(action: {
                sheetPresented = false
                viewModel.save()
            }, label: {
                Text("Save")
            })
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .lineSpacing(10)
        .background(Color.teal)
    }
}


final class NewTransactionViewModel: ObservableObject {
    @Published var title: String = ":)"
    @Published var category: String = ""
    @Published var amount: String = ""
    
    func save() {
        print([title, category, amount].joined(separator: " "))
    }
}

struct NewTransactionView_Preview: PreviewProvider {
    static var previews: some View {
        NewTransactionView(sheetPresented: .constant(true), viewModel: NewTransactionViewModel())
    }
}
