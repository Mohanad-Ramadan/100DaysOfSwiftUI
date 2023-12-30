//
//  FilteredList.swift
//  CoreDataLearn
//
//  Created by Mohanad Ramdan on 22/08/2023.
//

import SwiftUI
import CoreData

struct FilterData<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        List{
            ForEach(fetchRequest, id: \.self) { home in
                self.content(home)
            }
            .onDelete(perform: deleteRow)
        }
    }
    
    func deleteRow(offSet:IndexSet){
        offSet.map { fetchRequest[$0] }.forEach(moc.delete)
        try? moc.save()
    }
    
    init(filter:String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "unrappedPerson BEGINSWITH[c] %@", filter))
        self.content = content
    }
}

