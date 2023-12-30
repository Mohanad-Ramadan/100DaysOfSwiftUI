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
    @Environment(\.managedObjectContext) var moc
    let content: (T) -> Content
    
    //MARK: - init()
    init(filterWith: String, filterBy: String, sortby: [NSSortDescriptor], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortby, predicate: NSPredicate(format: "%k BEGINSWITH[c] %@", filterWith, filterBy))
        self.content = content
    }
    
    //MARK: - View
    var body: some View {
        List{
            ForEach(fetchRequest, id: \.self) { home in
                self.content(home)
            }
        }
    }
    
    
}

