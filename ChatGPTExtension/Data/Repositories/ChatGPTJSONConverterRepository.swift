//
//  ChatGPTAnalyzeRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class ChatGPTJSONConverterRepository: BaseChatGPTRepository, JSONConverterRepository {
    func analyze(code: String) async throws -> [Suggestion] {
        guard let apiKey = super.fetchApiKey() else {
            throw ConverterError.authorization
        }
        
        let openAI = OpenAI(key: apiKey)
        
        var suggestions: [Suggestion]?
        
        do {
            let chatpGPTResponse = try await openAI.analyze(source: code)
            
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

/**


1. Long method 
2. Guard statements could be simplified by using optional chaining
3. Coupling: `ChatGPTJSONConverterRepository` depends on `BaseChatGPTRepository`, `JSONConverterRepository`, and `OpenAI`.
4. `suggestions` is an optional that is force-unwrapped without being initialized to a default value.
5. `ChatGPTJSONConverterRepository` is a long and not descriptive enough name, it may violate the Single Responsibility Principle.
*/
