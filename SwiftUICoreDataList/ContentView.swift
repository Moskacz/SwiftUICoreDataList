//
//  ContentView.swift
//  SwiftUICoreDataList
//
//  Created by Michal Moskala on 06/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [Transaction.timestampSortDescriptor],
        animation: .default)
    private var transactions: FetchedResults<Transaction>
    
    @State
    private var navigationPath: [Transaction] = []
    
    @State
    private var addTransactionSheetPresented = false

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List(transactions) { transaction in
                NavigationLink("Transaction", value: transaction)
            }
            .navigationDestination(for: Transaction.self) { transaction in
                TransactionView(title: transaction.title,
                                category: transaction.category,
                                timestamp: itemFormatter.string(from: transaction.timestamp))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: { addTransactionSheetPresented = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $addTransactionSheetPresented) {
           NewTransactionView(sheetPresented: $addTransactionSheetPresented)
        }
    }


    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { transactions[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
