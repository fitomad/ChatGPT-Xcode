//
//  ExplainCodeRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 5/3/23.
//

import Foundation

protocol ExplainCodeRepository {
    func explainMeThis(code: String) async throws -> [Suggestion]
}
