//
//  ExplainCodeCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 5/3/23.
//

import Foundation
import XcodeKit

final class ExplainCodeCommand: NSObject, XCSourceEditorCommand {
    let useCase: ExplainCodeUseCase = DependencyManager.makeExplainCodeDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        Task {
            let fileSourceCode = invocation.buffer.completeBuffer
            
            do {
                let suggestion = try await self.useCase.explainMeThis(code: fileSourceCode)
                
                let insertedExplanation = "/**\n\(suggestion.result)\n*/"
                
                invocation.buffer.lines.add(insertedExplanation)
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
            
            completionHandler(nil)
        }
    }
}
