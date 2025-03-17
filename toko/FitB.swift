//
//  FitB.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 17/03/25.
//

import SwiftUI

struct FitB: View {
    @State private var easyEyeMode = false
    
    var body: some View {
        Text("FitB")
            .font(easyEyeMode ? .largeTitle : .title)
        //button color blue
        
        Button("Toggle Easy Eye Mode") {
          easyEyeMode.toggle()
        }.foregroundColor(.blue)
        .padding()
        .background(Color.yellow)
    }
}

#Preview {
    FitB()
}
