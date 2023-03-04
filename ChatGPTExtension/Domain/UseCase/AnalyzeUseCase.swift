//
//  AnalyzeUseCase.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

protocol JSONConverterUseCase {
    func analyze(source code: [String]) async -> Suggestion
}
