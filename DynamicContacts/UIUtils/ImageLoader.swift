//
//  ImageLoader.swift
//  DynamicContacts
//
//  Created by bogdanov on 12.04.21.
//

import Foundation
import SwiftUI

struct ImageWithURL: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }

    var body: some View {
        Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
            .resizable()
    }
}

class ImageLoaderAndCache: ObservableObject {
    @Published var imageData = Data()

    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            print("got image from cache")
            imageData = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, _ in
                if let data = data, let response = response {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        print("downloaded from internet")
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}
