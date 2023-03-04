//
//  OpenAI+Localizable.swift
//  ChatGPTExtension
//
//  Created by Adolfo Vera Blasco on 4/3/23.
//

import Foundation

extension OpenAI {
    func localizedPrompt(_ key: String) -> String {
        let openAIBundle = Bundle(for: Self.self)
        
        return NSLocalizedString(key, bundle: openAIBundle, comment: "")
    }
}
