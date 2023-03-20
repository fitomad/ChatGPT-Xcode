//
//  DefaultRegexUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 20/3/23.
//

import Foundation

final class DefaultRegexUseCase: RegexUseCase {
    private let repository: RegexRepository
    
    init(repository: RegexRepository) {
        self.repository = repository
    }
    
    func generateRegexFor(string value: String) async throws -> Suggestion {
        let suggestions = try await self.repository.generateRegexFor(string: value)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
