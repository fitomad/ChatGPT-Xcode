//
//  DefaultCodeSmellsUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class DefaultCodeSmellsUseCase: CodeSmellsUseCase {
    let repository: CodeSmellsRepository
    
    init(repository: CodeSmellsRepository) {
        self.repository = repository
    }
    
    func searchForCodeSmells(in code: [String]) async throws -> Suggestion {
        let preparedCode = code.reduce("") { $0 + $1 }
        
        let suggestions = try await self.repository.searchForCodeSmells(in: preparedCode)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
