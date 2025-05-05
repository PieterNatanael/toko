//
//  PrivacyDashboardView.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 04/05/25.
//


import SwiftUI

struct PrivacyDashboardView: View {
    @State private var shareWorkoutHistory = true
    @State private var shareLocation = false
    @State private var shareHealthData = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Kontrol Privasi")) {
                    Toggle("Bagikan Riwayat Latihan", isOn: $shareWorkoutHistory)
                    Toggle("Bagikan Data Lokasi", isOn: $shareLocation)
                    Toggle("Bagikan Data Kesehatan", isOn: $shareHealthData)
                }

                Section(header: Text("Lainnya")) {
                    NavigationLink("Lihat Kebijakan Privasi", destination: PrivacyPolicyView())
                }
            }
            .navigationTitle("Dasbor Privasi")
        }
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Kebijakan Privasi FitBuddy")
                    .font(.title2).bold()

                Text("Kami menghargai privasi Anda. Anda dapat memilih data apa saja yang ingin dibagikan melalui Dasbor Privasi. Kami tidak menjual data Anda, dan Anda bisa mengubah preferensi kapan saja.")

                Text("Data yang Kami Kumpulkan")
                    .font(.headline)

                Text("""
1. Data Latihan: Jenis dan durasi latihan.
2. Data Kesehatan: Langkah, detak jantung.
3. Data Lokasi: Jika Anda mengaktifkan pelacakan GPS.

Semua data dienkripsi dan hanya digunakan untuk meningkatkan pengalaman Anda.
""")

                Text("Anda memiliki hak untuk mengakses, menghapus, atau mengunduh data Anda kapan saja.")
            }
            .padding()
        }
        .navigationTitle("Kebijakan Privasi")
    }
}


#Preview {
PrivacyPolicyView()
}
