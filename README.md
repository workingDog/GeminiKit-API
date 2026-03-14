# GeminiKit-API


## Original code

A fork from [GeminiKit](https://github.com/guitaripod/GeminiKit) for my own requirements 
of using only the API code.

See [GeminiKit](https://github.com/guitaripod/GeminiKit) "A comprehensive Swift SDK for the Google Gemini API" for the original code. 

## Amendments

Removed all CLI code, external dependencies, and restructured "GeminiModel" to a struct.
Also minor mods to compile the Package with swift 6.2

## Installation

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/workingDog/GeminiKit-API", from: "1.0.0")
]
```

## Quick Start

```swift
import GeminiKit

// Initialize
let gemini = GeminiKit(apiKey: "YOUR_API_KEY")

// Generate text
let response = try await gemini.generateContent(
    model: GeminiModel("gemini-3-flash-preview"),
    prompt: "Explain quantum computing"
)

// Chat session
let chat = gemini.startChat(model: GeminiModel("gemini-3-flash-preview"))
let reply = try await chat.sendMessage("Hello!")

// Stream responses
let stream = try await chat.streamMessage("Tell me a story")
for try await chunk in stream {
    print(chunk, terminator: "")
}
```

## License

MIT License - see the original [LICENSE](LICENSE) file for details.
