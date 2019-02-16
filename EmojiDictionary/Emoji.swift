
import Foundation

struct Emoji: Codable {
    
    static var archiveURL: URL {
        
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("emoji").appendingPathExtension("plist")
    }
    
    var symbol: String
    var name: String
    var detailDescription: String
    var usage: String
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder: PropertyListEncoder = PropertyListEncoder()
        let data: URL = Emoji.archiveURL
        guard let encodedData = try? propertyListEncoder.encode(data) else { fatalError("Cannot encode") }
        
        try? encodedData.write(to: Emoji.archiveURL, options: .noFileProtection)

    }
    
    static func loadFromFile() -> [Emoji] {
        guard let dataToDecode: Data = try? Data(contentsOf: Emoji.archiveURL) else { return [] }
        let properyListDecoder: PropertyListDecoder = PropertyListDecoder()
        guard let decodedData: [Emoji] = try? properyListDecoder.decode([Emoji].self, from: dataToDecode) else { fatalError("Could not decode") }
        
        return decodedData
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        return [Emoji(symbol: "😀", name: "Grinning Face", detailDescription: "A typical smiley face.", usage: "happiness"),
                Emoji(symbol: "😕", name: "Confused Face", detailDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
                Emoji(symbol: "😍", name: "Heart Eyes", detailDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
                Emoji(symbol: "👮", name: "Police Officer", detailDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
                Emoji(symbol: "🐢", name: "Turtle", detailDescription: "A cute turtle.", usage: "Something slow"),
                Emoji(symbol: "🐘", name: "Elephant", detailDescription: "A gray elephant.", usage: "good memory"),
                Emoji(symbol: "🍝", name: "Spaghetti", detailDescription: "A plate of spaghetti.", usage: "spaghetti"),
                Emoji(symbol: "🎲", name: "Die", detailDescription: "A single die.", usage: "taking a risk, chance; game"),
                Emoji(symbol: "⛺️", name: "Tent", detailDescription: "A small tent.", usage: "camping"),
                Emoji(symbol: "📚", name: "Stack of Books", detailDescription: "Three colored books stacked on each other.", usage: "homework, studying"),
                Emoji(symbol: "💔", name: "Broken Heart", detailDescription: "A red, broken heart.", usage: "extreme sadness"),
                Emoji(symbol: "💤", name: "Snore", detailDescription: "Three blue \'z\'s.", usage: "tired, sleepiness"),
                Emoji(symbol: "🏁", name: "Checkered Flag", detailDescription: "A black and white checkered flag.", usage: "completion")]
    }
}
