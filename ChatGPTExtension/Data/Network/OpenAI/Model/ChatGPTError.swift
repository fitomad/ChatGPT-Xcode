//
//  ChatGPTError.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

enum ChatGPTError: Error {
    case malformedURL(value: String)
    case authentication
    case rateLimitReached
    case serverError
    case unknownServerResponse
    case malformedResponse
}
