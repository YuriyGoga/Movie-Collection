//
//  ImageService.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

final class ImageService {

    static let shared = ImageService()

    private var cache: NSCache<NSString, UIImage> = NSCache()

    func downLoadImage(url: URL, completion: @escaping (UIImage) -> Void) {
        let key = (url.absoluteString as NSString)
        if let image = cache.object(forKey: key) {
            completion(image)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpURLres = response as? HTTPURLResponse, httpURLres.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            self.cache.setObject(image, forKey: key)
            DispatchQueue.main.async {
                completion(image)
            }
        })
        dataTask.resume()
    }
}
