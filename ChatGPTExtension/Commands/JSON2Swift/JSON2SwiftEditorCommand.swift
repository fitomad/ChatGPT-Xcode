//
//  SourceEditorCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 3/3/23.
//

import Foundation
import XcodeKit

class JSON2SwiftEditorCommand: NSObject, XCSourceEditorCommand {
    let useCase: JSONConverterUseCase = DependencyManager.makeAnalyzeDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        guard let codeLines = invocation.buffer.lines as? [String] else {
            completionHandler(nil)
            return
        }
        
        Task {
            do {
                let suggestion = try await self.useCase.analyze(source: codeLines)
                
                invocation.buffer.lines.removeAllObjects()
                invocation.buffer.lines.add(suggestion.result)
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
            
            completionHandler(nil)
        }
    }
    
}
