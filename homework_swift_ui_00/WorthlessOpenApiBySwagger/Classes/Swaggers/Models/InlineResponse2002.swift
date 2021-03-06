//
// InlineResponse2002.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct InlineResponse2002: Codable {

    public var copyright: String?
    public var numResults: Int?
    public var results: [InlineResponse2002Results]?
    public var status: String?

    public init(copyright: String? = nil, numResults: Int? = nil, results: [InlineResponse2002Results]? = nil, status: String? = nil) {
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
        self.status = status
    }

    public enum CodingKeys: String, CodingKey { 
        case copyright
        case numResults = "num_results"
        case results
        case status
    }

}
