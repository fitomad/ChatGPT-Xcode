//
//  AnalyzeRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

protocol JSONConverterRepository {
    func analyze(code: String) async throws -> [Suggestion]
}
