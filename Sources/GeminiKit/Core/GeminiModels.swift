import Foundation


// MARK: - Gemini Model

public struct GeminiModel: Hashable, Sendable, Codable, ExpressibleByStringLiteral {
    public var modelId: String
    private var explicitMetadata: Metadata?

    public init(_ modelId: String, metadata: Metadata? = nil) {
        self.modelId = modelId
        self.explicitMetadata = metadata
    }

    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }

    public var metadata: Metadata {
        explicitMetadata ?? Self.inferMetadata(from: modelId)
    }

    public var supportsThinking: Bool { metadata.capabilities.contains(.thinking) }
    public var supportsImageGeneration: Bool { metadata.capabilities.contains(.imageGeneration) }
    public var supportsVideoGeneration: Bool { metadata.capabilities.contains(.videoGeneration) }
    public var supportsTTS: Bool { metadata.capabilities.contains(.tts) }
    public var supportsEmbeddings: Bool { metadata.capabilities.contains(.embeddings) }

    public var contextWindow: Int? { metadata.contextWindow }
    public var defaultThinkingBudget: Int? { metadata.defaultThinkingBudget }
    public var thinkingBudgetRange: ClosedRange<Int>? { metadata.thinkingBudgetRange }
}

public extension GeminiModel {
    
    struct Metadata: Hashable, Sendable, Codable {
        public let capabilities: Capabilities
        public let contextWindow: Int?
        public let defaultThinkingBudget: Int?
        public let thinkingBudgetRange: ClosedRange<Int>?

        public init(
            capabilities: Capabilities = [],
            contextWindow: Int? = nil,
            defaultThinkingBudget: Int? = nil,
            thinkingBudgetRange: ClosedRange<Int>? = nil
        ) {
            self.capabilities = capabilities
            self.contextWindow = contextWindow
            self.defaultThinkingBudget = defaultThinkingBudget
            self.thinkingBudgetRange = thinkingBudgetRange
        }
    }

    struct Capabilities: OptionSet, Hashable, Sendable, Codable {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }

        public static let thinking = Self(rawValue: 1 << 0)
        public static let imageGeneration = Self(rawValue: 1 << 1)
        public static let videoGeneration = Self(rawValue: 1 << 2)
        public static let tts = Self(rawValue: 1 << 3)
        public static let embeddings = Self(rawValue: 1 << 4)
    }
   
}

private extension GeminiModel {
    static func inferMetadata(from modelId: String) -> Metadata {
        let id = modelId.lowercased()
        if id.hasPrefix("imagen-") { return .init(capabilities: [.imageGeneration]) }
        if id.hasPrefix("veo-") { return .init(capabilities: [.videoGeneration]) }
        if id.contains("embedding") { return .init(capabilities: [.embeddings]) }
        if id.contains("tts") { return .init(capabilities: [.tts]) }
        if id.hasPrefix("gemini-") { return .init(capabilities: [.thinking]) }
        return .init()
    }
}

// MARK: - TTS Voice

public struct TTSVoice: Hashable, Sendable, Codable, ExpressibleByStringLiteral {
    public let name: String

    public init(_ name: String) {
        self.name = name
    }

    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

public extension TTSVoice {
    static let zephyr: Self = "Zephyr"
    static let puck: Self = "Puck"
    static let charon: Self = "Charon"
    static let kore: Self = "Kore"
    static let fenrir: Self = "Fenrir"
    static let leda: Self = "Leda"
    static let orus: Self = "Orus"
    static let aoede: Self = "Aoede"
    static let callirrhoe: Self = "Callirrhoe"
    static let autonoe: Self = "Autonoe"
    static let enceladus: Self = "Enceladus"
    static let iapetus: Self = "Iapetus"
    static let umbriel: Self = "Umbriel"
    static let algieba: Self = "Algieba"
    static let despina: Self = "Despina"
    static let erinome: Self = "Erinome"
    static let algenib: Self = "Algenib"
    static let rasalgethi: Self = "Rasalgethi"
    static let laomedeia: Self = "Laomedeia"
    static let achernar: Self = "Achernar"
    static let alnilam: Self = "Alnilam"
    static let schedar: Self = "Schedar"
    static let gacrux: Self = "Gacrux"
    static let pulcherrima: Self = "Pulcherrima"
    static let achird: Self = "Achird"
    static let zubenelgenubi: Self = "Zubenelgenubi"
    static let vindemiatrix: Self = "Vindemiatrix"
    static let sadachbia: Self = "Sadachbia"
    static let sadaltager: Self = "Sadaltager"
    static let sulafat: Self = "Sulafat"

    static let known: [Self] = [
        .zephyr, .puck, .charon, .kore, .fenrir, .leda, .orus, .aoede, .callirrhoe, .autonoe,
        .enceladus, .iapetus, .umbriel, .algieba, .despina, .erinome, .algenib, .rasalgethi,
        .laomedeia, .achernar, .alnilam, .schedar, .gacrux, .pulcherrima, .achird,
        .zubenelgenubi, .vindemiatrix, .sadachbia, .sadaltager, .sulafat
    ]
}

// MARK: - TTS Language 

public struct TTSLanguage: Hashable, Sendable, Codable, ExpressibleByStringLiteral {
    public let code: String

    public init(_ code: String) {
        self.code = code
    }

    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

public extension TTSLanguage {
    static let arabicEgypt: Self = "ar-EG"
    static let englishUS: Self = "en-US"
    static let german: Self = "de-DE"
    static let spanishUS: Self = "es-US"
    static let french: Self = "fr-FR"
    static let hindi: Self = "hi-IN"
    static let indonesian: Self = "id-ID"
    static let italian: Self = "it-IT"
    static let japanese: Self = "ja-JP"
    static let korean: Self = "ko-KR"
    static let portugueseBrazil: Self = "pt-BR"
    static let russian: Self = "ru-RU"
    static let dutch: Self = "nl-NL"
    static let polish: Self = "pl-PL"
    static let thai: Self = "th-TH"
    static let turkish: Self = "tr-TR"
    static let vietnamese: Self = "vi-VN"
    static let romanian: Self = "ro-RO"
    static let ukrainian: Self = "uk-UA"
    static let bengali: Self = "bn-BD"
    static let englishIndia: Self = "en-IN"
    static let marathi: Self = "mr-IN"
    static let tamil: Self = "ta-IN"
    static let telugu: Self = "te-IN"

    static let known: [Self] = [
        .arabicEgypt, .englishUS, .german, .spanishUS, .french, .hindi, .indonesian, .italian,
        .japanese, .korean, .portugueseBrazil, .russian, .dutch, .polish, .thai, .turkish,
        .vietnamese, .romanian, .ukrainian, .bengali, .englishIndia, .marathi, .tamil, .telugu
    ]
}


//enum GeminiModelError: Error {
//    case invalidModel(String)
//}
//
//func validateModelByProbe(_ modelId: String, gemini: GeminiKit) async throws -> GeminiModel {
//    let candidate = GeminiModel(modelId.trimmingCharacters(in: .whitespacesAndNewlines))
//    guard !candidate.modelId.isEmpty else { throw GeminiModelError.invalidModel(modelId) }
//
//    do {
//        _ = try await gemini.generateContent(
//            model: candidate,
//            prompt: "ping",
//            generationConfig: .init(maxOutputTokens: 1)
//        )
//        return candidate
//    } catch {
//        // Map library/API error types here if available
//        throw GeminiModelError.invalidModel(modelId)
//    }
//}
