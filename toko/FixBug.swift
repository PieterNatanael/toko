//
//  FixBug.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 31/03/25.
//

import SwiftUI

struct FixBugView: View {
    @State private var items : [String] = ["Apple", "Banana", "Cherry"]
    @State private var newItem = ""
    
    var body: some View {
        NavigationView {
            VStack {
          
                
                HStack{
                    TextField("Add new item", text: $newItem)
                    
                    Button(action: addItem){
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                        
                    }
                    .disabled(newItem.isEmpty)
                }
                .padding()
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Fruits")
            }
        }
    }
    
    func addItem(){
        items.append(newItem)
        newItem = ""
    }
    
    func deleteItem(at offsets: IndexSet) {
        // ❌ BUG: Deletion doesn't work
        items.remove(atOffsets: offsets)
    }
}

struct FixBugView_Previews: PreviewProvider {
    static var previews: some View {
        FixBugView()
    }
}
