//
//  RegexCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 21/3/23.
//

import Foundation
import XcodeKit

final class RegexCommand: NSObject, XCSourceEditorCommand {
    let useCase: RegexUseCase = DependencyManager.makeRegexDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        guard let selections = invocation.buffer.selections as? [XCSourceTextRange],
              let lines = invocation.buffer.lines as? [String]
        else
        {
            completionHandler(nil)
            return
        }
        
        Task {
            do {
                let selectedTexts = extractSelections(selections, fromText: lines)
                
                for selectedText in selectedTexts {
                    let suggestion = try await self.useCase.generateRegexFor(string: selectedText)
                    
                    let suggestedRegex = "/**\(suggestion.result)\n*/"
                    
                    invocation.buffer.lines.add(suggestedRegex)
                }
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
            
            completionHandler(nil)
        }
    }
    
    private func extractSelections(_ selections: [XCSourceTextRange], fromText lines: [String]) -> [String] {
        var selectedLines = [String]()
        
        for selection in selections where selection.start.line == selection.end.line {
            let line = lines[selection.start.line]
            
            let startIndex = line.index(line.startIndex, offsetBy: selection.start.column)
            let endIndex = line.index(line.startIndex, offsetBy: selection.end.column)
            
            let selectedText = String(line[startIndex..<endIndex])
            selectedLines.append(selectedText)
        }
        
        return selectedLines
    }
}
