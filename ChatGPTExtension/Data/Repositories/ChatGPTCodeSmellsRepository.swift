//
//  ChatGPTCodeSmellsRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class ChatGPTCodeSmellsRepository: BaseChatGPTRepository, CodeSmellsRepository {
    func searchForCodeSmells(in code: String) async throws -> [Suggestion] {
        guard let apiKey = super.fetchApiKey() else {
            throw ConverterError.authorization
        }
        
        let openAI = OpenAI(key: apiKey)
        
        var suggestions: [Suggestion]?
        
        do {
            let chatpGPTResponse = try await openAI.codeSmellsFor(code: code)
            
            suggestions = chatpGPTResponse.choices.map { choice in
                let suggestion = Suggestion(result: choice.message.content)
                
                return suggestion
            }
        } catch ChatGPTError.rateLimitReached {
            throw ConverterError.rateLimit
        } catch ChatGPTError.serverError {
            throw ConverterError.serverStatus
        } catch ChatGPTError.authentication {
            throw ConverterError.authorization
        } catch {
            throw ConverterError.unknownResponse
        }
        
        guard let suggestions else {
            throw ConverterError.emptyResults
        }
        
        return suggestions
    }
}
