//
//  CodeSmellsEditorCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation
import XcodeKit

final class CodeSmellsEditorCommand: NSObject, XCSourceEditorCommand {
    let useCase: CodeSmellsUseCase = DependencyManager.makeCodeSmellsDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation) async throws {
        guard let codeLines = invocation.buffer.lines as? [String] else {
            return
        }
        
        Task {
            do {
                let suggestion = try await self.useCase.searchForCodeSmells(in: codeLines)
                
                let insertedSuggestion = "/**\n\(suggestion.result)\n*/"
                
                invocation.buffer.lines.removeAllObjects()
                invocation.buffer.lines.add(suggestion.result)
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
        }
    }
}
