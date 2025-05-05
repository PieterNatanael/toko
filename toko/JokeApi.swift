//
//  Joke.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 05/04/25.
//


//async/await

import SwiftUI

struct Joke: Codable {
    let setup: String
    let punchline: String
}

@MainActor
class JokeViewModel: ObservableObject {
    @Published var joke: Joke?

    func fetchJoke() async {
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedJoke = try JSONDecoder().decode(Joke.self, from: data)
            joke = decodedJoke
        } catch {
            print("Failed to fetch joke: \(error.localizedDescription)")
        }
    }
}

struct JokeView: View {
    @StateObject private var viewModel = JokeViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let joke = viewModel.joke {
                Text(joke.setup)
                    .font(.largeTitle)
                Text(joke.punchline)
                    .font(.largeTitle.bold())
            } else {
                Text("Loading...")
            }

            Button("Get New Joke") {
                Task {
                    await viewModel.fetchJoke()
                }
                
                
            }
        }
        .padding()
        .font(.largeTitle.bold())
        .task {
            await viewModel.fetchJoke()
        }
    }
}


//work but use dispatchqueue, want to try simpler code useing aync/await
//import SwiftUI
//
//struct Joke: Codable {
//    let setup: String
//    let punchline: String
//}
//
//struct JokeView: View {
//    @State private var joke: Joke?
//
//    var body: some View {
//        VStack(spacing: 20) {
//            if let joke = joke {
//                Text(joke.setup)
//                    .font(.title2)
//                Text(joke.punchline)
//                    .font(.headline)
//            } else {
//                Text("Loading...")
//            }
//
//            Button("Get New Joke") {
//                fetchJoke()
//            }
//        }
//        .padding()
//        .onAppear(perform: fetchJoke)
//    }
//
//    func fetchJoke() {
//        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
//            print("Invalid URL")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                if let decoded = try? JSONDecoder().decode(Joke.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.joke = decoded
//                    }
//                }
//            } else if let error = error {
//                print("Error fetching joke: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}


#Preview {
    JokeView()
}
