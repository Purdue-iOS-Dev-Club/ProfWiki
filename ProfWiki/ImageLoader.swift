//
//  ImageLoader.swift
//  ProfWiki
//
//  Created by Harjas Monga on 10/13/20.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage = UIImage()
    private var path: String
    
    init(path: String) {
        self.path = path
    }
    
    func load() {
        guard let imageUrl = URL(string: path) else {
            return
        }
        let imageRequest = URLRequest(url: imageUrl)
        
        let task = URLSession.shared.dataTask(with: imageRequest) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("data missing")
                return
            }
            guard let decodedImage = UIImage(data: data) else {
                print("data missing")
                return
            }
            DispatchQueue.main.async {
                self.image = decodedImage
            }
        }
        
        task.resume()
    }
}
