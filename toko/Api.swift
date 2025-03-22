//
//  Api.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 22/03/25.
//

import SwiftUI

struct ApiView: View {
    @State private var weather : String = "Loading..."

    var body: some View {
        VStack {
            Text("Weather: \(weather)")
                .font(.title)
                .padding()

            Button("Fetch Weather") {
                fetchWeather()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

    func fetchWeather() {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=Singapore")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                let result = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                DispatchQueue.main.async {
                    weather = result?.current.temp_c.description ?? "Error"
                }
            }
        }.resume()
    }
}

struct WeatherResponse: Codable {
    let current: Weather
}

struct Weather: Codable {
    let temp_c: Double
}

#Preview {
    ApiView()
}
