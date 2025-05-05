//
//  FitBuddyPrototypeView.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 04/05/25.
//


import SwiftUI

struct FitBuddyPrototypeView: View {
    @State private var colorBlindMode = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    
                    // Voice Command Section
                    voiceCommandSection
                    
                    // Gesture Interface Section
                    gestureInterfaceSection
                    
                    // Visual Enhancement Section
                    visualEnhancementSection
                }
                .padding()
                .navigationTitle("FitBuddy")
                .background(colorBlindMode ? Color.black : Color(.systemBackground))
            }
        }
    }
    
    var voiceCommandSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("🎙️ Antarmuka Suara")
                .font(.title2)
                .bold()
                .foregroundColor(colorBlindMode ? .yellow : .primary)

            HStack {
                Image(systemName: "mic.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(colorBlindMode ? .yellow : .blue)
                Text("Katakan: “Berapa langkah saya hari ini?”\nAtau: “Mulai latihan yoga.”")
                    .font(.body)
                    .foregroundColor(colorBlindMode ? .white : .secondary)
            }
            .padding()
            .background(colorBlindMode ? Color.gray.opacity(0.3) : Color.blue.opacity(0.1))
            .cornerRadius(12)
        }
    }
    
    var gestureInterfaceSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("✋ Interaksi Gestur")
                .font(.title2)
                .bold()
                .foregroundColor(colorBlindMode ? .yellow : .primary)

            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
                    .cornerRadius(12)
                    .overlay(
                        Text("Tampilan Kamera")
                            .foregroundColor(.gray)
                    )
                
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10]))
                    .frame(width: 150, height: 100)
                    .foregroundColor(colorBlindMode ? .yellow : .blue)
            }

            Text("Gesekkan tangan di depan kamera untuk memulai/berhenti latihan.")
                .font(.body)
                .foregroundColor(colorBlindMode ? .white : .secondary)
        }
    }
    
    var visualEnhancementSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("👁️ Penyempurnaan Visual")
                .font(.title2)
                .bold()
                .foregroundColor(colorBlindMode ? .yellow : .primary)
            
            Toggle("Mode Tunanetra (Color Blind Mode)", isOn: $colorBlindMode)
                .toggleStyle(SwitchToggleStyle(tint: .green))
            
            HStack {
                Image(systemName: "eye.fill")
                    .resizable()
                    .frame(width: 40, height: 25)
                    .foregroundColor(colorBlindMode ? .yellow : .blue)
                Text("Kontras tinggi, teks besar, dan warna yang ramah untuk penglihatan parsial.")
                    .font(.body)
                    .foregroundColor(colorBlindMode ? .white : .secondary)
            }
            .padding()
            .background(colorBlindMode ? Color.gray.opacity(0.3) : Color.blue.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

#Preview {
    FitBuddyPrototypeView()
}
