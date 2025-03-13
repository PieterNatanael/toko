//
//  Enum.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 12/03/25.
//

import SwiftUI

enum Mood:CaseIterable{
    case happy, sad, neutral
}

struct EnumViewModel: View {

    @State private var currentMood:Mood = .sad
    
    var moodText: String {
        switch currentMood {
        case .happy: return "Happy 😊"
        case .sad: return "Sad 😢"
        case .neutral: return "Neutral 😐"
        }
    }
    func randomMood() {
        currentMood = Mood.allCases.randomElement()!
    }
    
    
    func changeMood(){
        switch currentMood {
        case .happy:
            currentMood = .sad
        case .sad:
            currentMood = .neutral
        case .neutral:
            currentMood = .happy
        }
    }
    
    var body: some View {
        VStack {
            Text("my mood is \(moodText)")
            
            
            Button("Change Mood") {
                changeMood()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            Button("Random mood"){
                randomMood()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
    }
}
#Preview {
    EnumViewModel()
}
