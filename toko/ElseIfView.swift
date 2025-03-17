//
//  ElseIfView.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 13/03/25.
//


import SwiftUI

struct ElseIfView : View {
    @State private var age : Int = 17
    @State private var message: String = ""
    
    var body : some View {
        VStack{
            Text("Enter your age:")
                .font(.largeTitle)
            
            TextField("Age", value: $age, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                                
                                Button("Check category"){
                    if age < 13 {
                        message = "You are a child"
                    } else if age < 18 {
                        message = "You are a teenager"
                    } else {
                        message = "You are an adult"
                    }
                    
                }
                    .padding()
                Text(message)
                    .font(.title)
                    .padding()
        }
                    .padding()
    }
}


#Preview {
ElseIfView()
}

