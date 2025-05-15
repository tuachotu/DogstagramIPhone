//
//  ContentView.swift
//  Dogstagram
//
//  Created by Vikrant Singh on 5/12/25.
//

import SwiftUI

struct ContentView: View {
    enum ScreenMode {
        case home, camera, capture, convert
    }

    @State private var mode: ScreenMode = .home

    var body: some View {
        switch mode {
        case .camera:
            ZStack {
                Color.black
                    .ignoresSafeArea()

                CameraView()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Button("Stop Camera") {
                        mode = .home
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    .padding(.bottom, 40)
                }
            }

        case .capture, .convert:
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 20) {
                    Spacer()
                    Text("Paws at Work 🐾 🛠️")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text(mode == .capture ? "Taking a photo is coming soon!" : "Photo conversion coming soon!")
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Button("Back to Home") {
                        mode = .home
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.bottom, 40)
                }
            }

        case .home:
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 24) {
                    Spacer()
                    Image("Homepage")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .shadow(radius: 10)

                    Text("Dogstagram")
                        .font(.system(size: 48, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)

                    Text("See the world through your dog's eyes")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))

                    Button("Fetch the View!") {
                        mode = .camera
                    }
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.3))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .padding(.horizontal, 40)

                    VStack(spacing: 12) {
                        Button("Take a Pawtrait") {
                            mode = .capture
                        }
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)

                        Button("Paw-ify a Photo") {
                            mode = .convert
                        }
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
