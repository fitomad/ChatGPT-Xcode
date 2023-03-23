//
//  DefaultCommentUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 22/3/23.
//

import Foundation

final class DefaultCommentUseCase: CommentUseCase {
    private let repository: CommentRepository
    
    init(repository: CommentRepository) {
        self.repository = repository
    }
    
    func comment(function code: [String]) async throws -> Suggestion {
        let preparedCode = code.reduce("") { $0 + $1 }
        
        let suggestions = try await self.repository.comment(function: preparedCode)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
