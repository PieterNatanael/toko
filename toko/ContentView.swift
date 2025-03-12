//
//  ContentView.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 11/03/25.
//

import SwiftUI


struct Product: Identifiable{
    let id = UUID()
    let name: String
    let price: Int
    let imageName: String
}

struct productView: View{
    let product: Product
    
    var body: some View {
        VStack(){
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:150)
                .cornerRadius(10)
            
            Text(product.name)
                .font(.headline)
            
            Text("$\(String(format: "%.2f", product.price))")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Button(action: {
                print("Added \(product.name) to cart")
            }) {
                Text("Add to cart")
                    .font(.subheadline)
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 13
        )
    }
}



struct ContentView: View {
    //sample prodduct data
    let products = [
    Product(name: "iPhone 15", price: 399, imageName:"iPhone15"),
    Product(name: "iPhone 16", price: 399, imageName:"iPhone16"),
    Product(name: "iPhone 17", price: 399, imageName:"iPhone17"),
    Product(name: "iPhone 13", price: 399, imageName:"iPhone13")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16){
                    ForEach(products) { product in
                        productView(product: product)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Products"))
        }
    }
}

#Preview {
    ContentView()
}
