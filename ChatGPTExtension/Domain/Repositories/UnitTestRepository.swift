//
//  UnitTestRepository.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 19/3/23.
//

import Foundation

protocol UnitTestRepository {
    func generateTestsFor(source code: String) async throws -> [Suggestion]
}
