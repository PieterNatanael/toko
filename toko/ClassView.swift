//
//  class.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 12/03/25.
//

import SwiftUI

class TapCounter: ObservableObject{
    @Published var tapCount = 0
    
    func increment(){
        tapCount += 1
    }
}

struct ClassView: View {
    @ObservedObject var tapCounter = TapCounter()
    
    var body: some View {
        VStack {
            Text("Button tapped \(tapCounter.tapCount) times")
                .font(.title)
                .padding()
            
            Button(action: {
                tapCounter.increment()
            }){
                Text("Tap me")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(10
                    )
                
            }
            .padding()
        }
    }
}

#Preview {
    ClassView()
}
