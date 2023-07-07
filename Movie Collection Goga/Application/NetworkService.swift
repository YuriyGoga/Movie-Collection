//
//  NetworkService.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import Foundation
import UIKit

class NetworkService {

    func loadMovies(completion: @escaping ([Movie]) -> Void) {
        var movies: [Movie] = []
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0120737")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0265086")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0093058")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0111161")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0068646")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0108052")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0109830")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt1375666")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0133093")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0120815")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        getData(url: .omdbImage(id: "tt0110357")) { movie in
            movies.append(movie)
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            completion(movies)
        }
    }

    private func getData(url: String, completion: @escaping (Movie) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Movie.self, from: data!)
                    completion(data)

                }catch {
                        print(error)
                    }
            }

        }
        task.resume()
    }
}

extension String {

    static func omdbImage(id: String) -> String {
        String("https://www.omdbapi.com/?apikey=311663ff&i=" + id)
    }
}
