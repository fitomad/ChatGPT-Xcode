//
//  ChatGPTAnalyzeRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

final class ChatGPTJSONConverterRepository: JSONConverterRepository {
    func analyze(code: String) async throws -> [Suggestion] {
        let currentBundle = Bundle(for: Self.self)
        
        guard let apiKeyURL = currentBundle.url(forResource: "openai", withExtension: "environment"),
              var apiKey = try? String(contentsOf: apiKeyURL, encoding: .utf8)
        else
        {
            throw ConverterError.authorization
        }
        
        apiKey = apiKey.trimmingCharacters(in: .whitespacesAndNewlines)
        
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
