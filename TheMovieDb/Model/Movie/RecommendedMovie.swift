//
//  RecommendedMovie.swift
//  TheMovieDb
//
//  Created by Michael do Prado on 11/1/21.
//

import Foundation

struct RecommendedMovie: Codable {
  
  let id: Int
  let title: String
  let posterPath: String?
  let overview: String
  let voteAverage: Float
  
  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case posterPath = "poster_path"
    case overview
    case voteAverage = "vote_average"
  }
}

struct ListRecommendedMovies: Decodable {
  let results: [RecommendedMovie]?
}