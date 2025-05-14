//
//  ContentView.swift
//  Dogstagram
//
//  Created by Vikrant Singh on 5/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isCameraActive = false

    var body: some View {
        ZStack {
            if isCameraActive {
                // MARK: Live camera mode
                CameraView()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Button(action: {
                        isCameraActive = false
                    }) {
                        Text("Stop Camera")
                            .font(.headline)
                            .padding()
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 40)
                }
            } else {
                // MARK: Start screen
                ZStack {
                    // Gradient background
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack(spacing: 24) {
                        Spacer()

                        // App icon
                        Image("Homepage")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .shadow(radius: 10)

                        // Title
                        Text("Dogstagram")
                            .font(.system(size: 48, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)

                        // Subtitle
                        Text("See the world through your dog's eyes")
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.8))

                        // Start button
                        Button(action: {
                            isCameraActive = true
                        }) {
                            Text("Fetch the View!")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .padding(.horizontal, 40)

                        Spacer()
                    }
                }
            }
        }
    }
}
