//
//  DefaultAnalyzeUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class DefaultJSONConverterUseCase: JSONConverterUseCase {
    let repository: JSONConverterRepository
    
    init(repository: JSONConverterRepository) {
        self.repository = repository
    }
    
    func analyze(source code: [String]) async throws -> Suggestion {
        let preparedCode = code.reduce("") { $0 + $1 }
        print(preparedCode)
        let suggestions = try await self.repository.analyze(code: preparedCode)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
