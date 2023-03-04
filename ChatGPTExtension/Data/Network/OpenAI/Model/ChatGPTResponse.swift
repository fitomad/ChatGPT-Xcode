//
//  ChatGPTResponse.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

struct ChatGPTResponse: Decodable, Identifiable {
    let id: String
    let object: String
    let model: String
    let usage: ChatGPTResponse.Usage
    let choices: [ChatGPTResponse.Choice]
}

extension ChatGPTResponse {
    struct Usage: Decodable {
        let promptTokenCount: Int
        let completionTokenCount: Int
        let totalTokens: Int
        
        private enum CodingKeys: String, CodingKey {
            case promptTokenCount = "prompt_tokens"
            case completionTokenCount = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }
    
    struct Message: Decodable {
        let role: String
        let content: String
    }
    
    struct Choice: Decodable {
        let message: ChatGPTResponse.Message
        let finishReason: String
        let index: Int
        
        private enum CodingKeys: String, CodingKey {
            case message
            case finishReason = "finish_reason"
            case index
        }
    }
}
