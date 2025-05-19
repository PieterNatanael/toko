//
//  ContentView 2.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 19/05/25.
//


import SwiftUI

struct ContentView2: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Beranda", systemImage: "house")
                }
            
            PlantStatusView()
                .tabItem {
                    Label("Status", systemImage: "leaf.fill")
                }
            
            CameraCheckView()
                .tabItem {
                    Label("Kamera", systemImage: "camera")
                }
            
            TipsView()
                .tabItem {
                    Label("Tips", systemImage: "lightbulb")
                }
            
            FarmOverviewView()
                .tabItem {
                    Label("Kebun", systemImage: "rectangle.stack")
                }
            
            HarvestDataView()
                .tabItem {
                    Label("Panen", systemImage: "chart.bar")
                }
            
            ScheduleView()
                .tabItem {
                    Label("Jadwal", systemImage: "calendar")
                }
        }
    }
}

// MARK: - View 1: Home
struct HomeView: View {
    @State private var isFarmer = true

    var body: some View {
        NavigationView {
            VStack {
                Picker("Peran", selection: $isFarmer) {
                    Text("👨‍🌾 Petani").tag(true)
                    Text("🏢 Perusahaan").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if isFarmer {
                    Text("Selamat datang, Petani!")
                        .font(.title)
                } else {
                    Text("Selamat datang, Perusahaan!")
                        .font(.title)
                }

                Spacer()
            }
            .navigationTitle("Pantau Kebun")
        }
    }
}

// MARK: - View 2: Plant Status
struct PlantStatusView: View {
    var body: some View {
        VStack {
            Text("Status Tanaman")
                .font(.largeTitle)
                .padding()

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.green.opacity(0.1))
                .frame(height: 120)
                .overlay(
                    VStack(alignment: .leading) {
                        Text("Kelembaban: Rendah")
                        Text("Suhu: 32°C")
                        Text("Cahaya: Cukup")
                    }
                    .padding()
                    .font(.title2)
                )

            Spacer()
        }
        .padding()
    }
}

// MARK: - View 3: Camera Check
struct CameraCheckView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Cek Penyakit Tanaman")
                .font(.largeTitle)
                .padding()

            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Button("Ambil Foto") {
                // mock function
            }
            .font(.title2)
            .padding()
            .background(Color.orange.opacity(0.3))
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}

// MARK: - View 4: Tips
struct TipsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("💡 Tips Perawatan")
                .font(.largeTitle)
                .padding(.bottom)

            Text("• Sirami tanaman pagi dan sore.")
            Text("• Cek daun secara rutin untuk deteksi hama.")
            Text("• Gunakan pupuk organik tiap minggu.")

            Spacer()
        }
        .padding()
    }
}

// MARK: - View 5: Farm Overview
struct FarmOverviewView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("📊 Data Kebun")
                .font(.largeTitle)

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.yellow.opacity(0.2))
                .frame(height: 100)
                .overlay(Text("5 kebun aktif\n2 kebun ada masalah").padding())

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.1))
                .frame(height: 100)
                .overlay(Text("Kebun 3: Serangan ulat terdeteksi").padding())

            Spacer()
        }
        .padding()
    }
}

// MARK: - View 6: Harvest Data
struct HarvestDataView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("📈 Data Panen")
                .font(.largeTitle)

            Text("Tomat (April): 1.2 Ton")
            Text("Cabai (April): 800 kg")
            Text("Tomat (Mei): 1.4 Ton")
            Text("Cabai (Mei): 760 kg")

            Spacer()
        }
        .padding()
    }
}

// MARK: - View 7: Schedule Manager
struct ScheduleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("📅 Jadwal Panen")
                .font(.largeTitle)

            HStack {
                VStack(alignment: .leading) {
                    Text("Tomat")
                    Text("20 Juni 2025")
                        .font(.subheadline)
                }
                Spacer()
                Button("Edit") { }
            }

            Divider()

            HStack {
                VStack(alignment: .leading) {
                    Text("Cabai")
                    Text("27 Juni 2025")
                        .font(.subheadline)
                }
                Spacer()
                Button("Edit") { }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView2()
}
