//
//  SourceEditorCommand.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 3/3/23.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    let useCase: JSONConverterUseCase = DependencyManager.makeAnalyzeDependencies()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        guard let codeLines = invocation.buffer.lines as? [String] else {
            completionHandler(nil)
            return
        }
        
        Task {
            let suggestion = try await self.useCase.analyze(source: codeLines)
            print(suggestion.result)
            
            completionHandler(nil)
        }
    }
    
}
