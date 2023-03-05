//
//  OpenAI+Operations.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 5/3/23.
//

import Foundation

extension OpenAI {
    func codeSmellsFor(code: String) async throws -> ChatGPTResponse {
        let smellsPrompt = "\(localizedPrompt("PROMPT_CODE_SMELLS")) \(code)"
        
        return try await processRequestFor(prompt: smellsPrompt)
    }
    
    func analyze(source code: String) async throws -> ChatGPTResponse {
        let jsonPrompt = "\(localizedPrompt("PROMPT_JSON")) \(code)"
        
        return try await processRequestFor(prompt: jsonPrompt)
    }
    
    func explain(source code: String) async throws -> ChatGPTResponse {
        let explainPrompt = "\(localizedPrompt("PROMPT_EXPLAIN_CODE")) \(code)"
        
        return try await processRequestFor(prompt: explainPrompt)
    }
}
