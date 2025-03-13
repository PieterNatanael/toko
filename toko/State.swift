//
//  State.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 13/03/25.
//

import SwiftUI

struct StateView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack{
            Text(count.description)
                .font(.largeTitle)
            Button("add"){
                count += 1
            }
        }
        
    }
}



#Preview {
    StateView()
}
