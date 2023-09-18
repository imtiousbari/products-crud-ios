//
//  RemoteImage.swift
//  product
//
//  Created by Imtious Bari on 18/9/23.
//
import SwiftUI

struct RemoteImage: View {
    let url: String
    
    @State private var image: UIImage? = nil

    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        } else {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .onAppear {
                    Task {
                        await loadImage()
                    }
                }
        }
    }

    private func loadImage() async {
        guard let imageUrl = URL(string: url) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: imageUrl)
            image = UIImage(data: data)
        } catch {
            print("Error loading image: \(error)")
        }
    }
}
