//
//  DependencyManager.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class DependencyManager {
    static func makeAnalyzeDependencies() -> JSONConverterUseCase {
        let jsonConverterRepository: JSONConverterRepository = ChatGPTJSONConverterRepository()
        let useCase: JSONConverterUseCase = DefaultJSONConverterUseCase(repository: jsonConverterRepository)
        
        return useCase
    }
    
    static func makeCodeSmellsDependencies() -> CodeSmellsUseCase {
        let codeSmellsRepository: CodeSmellsRepository = ChatGPTCodeSmellsRepository()
        let useCase: CodeSmellsUseCase = DefaultCodeSmellsUseCase(repository: codeSmellsRepository)
        
        return useCase
    }
}
