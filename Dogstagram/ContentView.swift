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
                VStack(spacing: 24) {
                    Spacer()
                    Image(systemName: "pawprint.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    Text("Dogstagram")
                        .font(.largeTitle)
                        .bold()
                    Button(action: {
                        isCameraActive = true
                    }) {
                        Text("Start Camera")
                            .font(.title2)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}
