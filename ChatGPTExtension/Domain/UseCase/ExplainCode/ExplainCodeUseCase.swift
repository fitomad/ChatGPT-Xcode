//
//  ExplainCodeUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 5/3/23.
//

import Foundation

protocol ExplainCodeUseCase {
    func explainMeThis(code: String) async throws -> Suggestion
}
