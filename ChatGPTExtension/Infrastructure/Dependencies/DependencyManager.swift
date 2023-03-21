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
    
    static func makeExplainCodeDependencies() -> ExplainCodeUseCase {
        let explainCodeRepository: ExplainCodeRepository = ChatGPTExplainCodeRepository()
        let useCase: ExplainCodeUseCase = DefaultExplainCodeUseCase(repository: explainCodeRepository)
        
        return useCase
    }
    
    static func makeUnitTestsDependencies() -> UnitTestUseCase {
        let unitTestRepository: UnitTestRepository = ChatGPTUnitTestRepository()
        let useCase: UnitTestUseCase = DefaultUnitTestUseCase(repository: unitTestRepository)
        
        return useCase
    }
    
    static func makeRegexDependencies() -> RegexUseCase {
        let regexRepository: RegexRepository = ChatGPTRegexRepository()
        let useCase: RegexUseCase = DefaultRegexUseCase(repository: regexRepository)
        
        return useCase
    }
}

