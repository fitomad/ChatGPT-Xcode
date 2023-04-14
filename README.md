# ChatGPT-Xcode

This repository serves as the basis for the Medium article titled ["Integrating ChatGPT into Xcode: How to Improve Your Apps with AI."](https://medium.com/globant/chatgpt-integration-in-xcode-how-to-improve-your-apps-with-ai-3bdbc34bea48)

Integrating ChatGPT into Xcode using an Xcode Source Editor Extension that solves three specific problems:

* **Code conversion**. A command that converts a JSON document to a Swift struct.
* **Code smells**. We ask ChatGPT to try to identify things that can be improved in our source code.
* **Code explanation**. In this last case, we are interested in knowing what a particular code does.
* **Unit testing**. Generate XCTest code for the current file.
* **Regex**. Creates a regular expression based on the selected text string.

## OpenAI API Key

To execute the extension commands, an OpenAI API key is required, which must be saved in a file called `openai.environment` and will only contain the key.

This file must be included in the Xcode extension target.

## Disclaimer. Read carefully

Usage of this Source Code Extension will **send your source code to ChatGPT**, please note that due to the nature of the internet, It does not guarantee the security of any information transmitted to OpenAI, including source code.

Before using code that you don't own with this Source Code Extension, contact its owner to obtain the necessary permission.
