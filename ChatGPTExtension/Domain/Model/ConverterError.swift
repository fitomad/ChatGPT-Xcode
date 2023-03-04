//
//  ConverterError.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

enum ConverterError: Error {
    case emptyResults
    case authorization
    case rateLimit
    case serverStatus
    case unknownResponse
}
