//
// InlineResponse2003ResultsLists.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct InlineResponse2003ResultsLists: Codable {

    public var books: [InlineResponse2003ResultsBooks]?
    public var displayName: String?
    public var listId: Int?
    public var listImage: String?
    public var listName: String?
    public var updated: String?

    public init(books: [InlineResponse2003ResultsBooks]? = nil, displayName: String? = nil, listId: Int? = nil, listImage: String? = nil, listName: String? = nil, updated: String? = nil) {
        self.books = books
        self.displayName = displayName
        self.listId = listId
        self.listImage = listImage
        self.listName = listName
        self.updated = updated
    }

    public enum CodingKeys: String, CodingKey { 
        case books
        case displayName = "display_name"
        case listId = "list_id"
        case listImage = "list_image"
        case listName = "list_name"
        case updated
    }

}
