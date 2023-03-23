//
//  CommentCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 22/3/23.
//

import Foundation
import XcodeKit

final class CommentCommand: NSObject, XCSourceEditorCommand {
    let useCase: CommentUseCase = DependencyManager.makeCommentDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        guard let codeLines = invocation.buffer.lines as? [String],
              let selections = invocation.buffer.selections as? [XCSourceTextRange],
              let xcodeSelection = selections.first
        else
        {
            completionHandler(nil)
            return
        }
        
        Task {
            do {
                let functionLines = extractSelectedTextFrom(selection: xcodeSelection, from: codeLines)
                let suggestion = try await self.useCase.comment(function: functionLines)
                
                let comment = "/**\(suggestion.result)\n*/"
                
                invocation.buffer.lines.insert(comment, at: xcodeSelection.start.line)
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
            
            completionHandler(nil)
        }
    }
    
    private func extractSelectedTextFrom(selection: XCSourceTextRange, from lines: [String]) -> [String] {
        let selectedLinesSlice = lines[selection.start.line..<selection.end.line]
        let selectedLines = Array<String>(selectedLinesSlice)
        
        return selectedLines
    }
}
