import UIKit

let jsonString01 = """
 {
  "title" : "09DRO0000006W0Q",
  "message" : "LightningWebComponent",
  "messageData" : [
    {
    "url" : "services/data/v51.0/quickActions/barcodeScanner",
    "label" : "services/data/v51.0/quickActions/barcodeScanner/describe"
    }
  ]
}
"""

let jsonString02 = """
 {
  "title" : "09DRO0000006W0Q",
  "message" : "LightningWebComponent",
  "messageData" : ["label", "label2"]
}
"""

public struct ToastModel: Decodable {
    public let title: String
    public let message: String
    public let messageData: MessageDataValue
    enum CodingKeys: String, CodingKey {
        case title
        case message
        case messageData
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        message = try container.decode(String.self, forKey: .message)
        messageData = try container.decode(MessageDataValue.self, forKey: .messageData)

    }
}

public struct ToastMessageData: Decodable {
    public let url: String
    public let label: String
}

public enum MessageDataValue: Decodable {
    case string([String]?)
    case objectType([ToastMessageData]?)
    enum MessageDataValue: Error {
        case missingValue
    }
    public init(from decoder: Decoder) throws {
        if let str = try? decoder.singleValueContainer().decode([String]?.self) {
            self = .string(str)
            return
        }
        print("hello!")
        if let obj = try? decoder.singleValueContainer().decode([ToastMessageData]?.self) {
            self = .objectType(obj)
            return
        }
        throw MessageDataValue.missingValue
    }
}

let decoder = JSONDecoder()

do {
    let inputData = jsonString02.data(using: .utf8)!
    let decoder = JSONDecoder()
    let response = try decoder.decode(ToastModel.self, from: inputData)
    print("\n")
    print(response)
} catch {
    print(error)
}
