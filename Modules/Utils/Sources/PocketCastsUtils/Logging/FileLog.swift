import Combine
import Foundation
import os

public class FileLog {
    public static let shared = FileLog()
    private static let logger = Logger()

    public func addMessage(_ message: String?) {
        guard let message, !message.isEmpty else { return }

        Self.logger.log("\(message)")
    }
}
