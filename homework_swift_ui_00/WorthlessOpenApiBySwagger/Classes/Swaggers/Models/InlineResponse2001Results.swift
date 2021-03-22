//
// InlineResponse2001Results.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct InlineResponse2001Results : Decodable {

    public var ageGroup: String?
    public var author: String?
    public var contributor: String?
    public var contributorNote: String?
    public var _description: String?
    public var isbns: [InlineResponse2001Isbns]?
    public var price: Int?
    public var publisher: String?
    public var ranksHistory: [InlineResponse2001RanksHistory]?
    public var reviews: [InlineResponse2001Reviews]?
    public var title: String?

    public init(ageGroup: String? = nil, author: String? = nil, contributor: String? = nil, contributorNote: String? = nil, _description: String? = nil, isbns: [InlineResponse2001Isbns]? = nil, price: Int? = nil, publisher: String? = nil, ranksHistory: [InlineResponse2001RanksHistory]? = nil, reviews: [InlineResponse2001Reviews]? = nil, title: String? = nil) {
        self.ageGroup = ageGroup
        self.author = author
        self.contributor = contributor
        self.contributorNote = contributorNote
        self._description = _description
        self.isbns = isbns
        self.price = price
        self.publisher = publisher
        self.ranksHistory = ranksHistory
        self.reviews = reviews
        self.title = title
    }

    public init(from decoder: Decoder) throws { }
    
    public enum CodingKeys: String, CodingKey { 
        case ageGroup = "age_group"
        case author
        case contributor
        case contributorNote = "contributor_note"
        case _description = "description"
        case isbns
        case price
        case publisher
        case ranksHistory = "ranks_history"
        case reviews
        case title
    }

}
