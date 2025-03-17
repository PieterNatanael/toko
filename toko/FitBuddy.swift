//
//  FitBit.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 17/03/25.
//




import SwiftUI

struct FitBuddy: View {
    @State private var easyEyeEnabled = false
    @State private var steps = 1234
    @State private var distance = 1.2
    @State private var calories = 56
    @State private var showMotivationAlert = false  // State to control the alert
    
    var body: some View {
        VStack(spacing: easyEyeEnabled ? 30 : 20) {
            Text("FitBuddy")
                .font(easyEyeEnabled ? .largeTitle : .title)
                .bold()
            
            VStack(spacing: easyEyeEnabled ? 20 : 10) {
                StatView(title: "Total Steps", value: "\(steps)", easyEye: easyEyeEnabled)
                StatView(title: "Distance", value: "\(distance) km", easyEye: easyEyeEnabled)
                StatView(title: "Calories Burned", value: "\(calories) kcal", easyEye: easyEyeEnabled)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
            
            Toggle("Easy Eye Mode", isOn: $easyEyeEnabled)
                .padding()
                .font(easyEyeEnabled ? .title2 : .body)
            
            HStack {
                Button("History") { /* Show history */ }
                    .buttonStyle(FitButtonStyle(easyEye: easyEyeEnabled))
                
                Button("Settings") {
                    showMotivationAlert = true  // Trigger the alert
                }
                .buttonStyle(FitButtonStyle(easyEye: easyEyeEnabled))
            }
        }
        .padding()
        .alert("Keep It Up! 🎉", isPresented: $showMotivationAlert) {
            Button("Thanks!", role: .cancel) { }
        } message: {
            Text("You're doing great! Stay active and keep moving towards a healthier you. 💪🚶‍♂️")
        }
    }
}

struct StatView: View {
    let title: String
    let value: String
    let easyEye: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(easyEye ? .title2 : .body)
                .bold()
            Spacer()
            Text(value)
                .font(easyEye ? .title : .headline)
        }
        .padding(.horizontal)
    }
}

struct FitButtonStyle: ButtonStyle {
    let easyEye: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(easyEye ? .title2 : .body)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: configuration.isPressed ? 2 : 5)
    }
}

#Preview {
    FitBuddy()
}
