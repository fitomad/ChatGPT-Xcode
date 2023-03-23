//
//  CommentRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 22/3/23.
//

import Foundation

protocol CommentRepository {
    func comment(function code: String) async throws -> [Suggestion]
}
