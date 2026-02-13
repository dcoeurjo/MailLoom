import Foundation
import AppKit

class EmailService {
    func sendEmails(to recipients: [Recipient]) -> [Bool] {
        var results: [Bool] = []
        
        for recipient in recipients {
            let success = createEmailInMailApp(
                to: recipient.email,
                subject: "Message for \(recipient.name)",
                body: personalizeMessage(recipient.message, for: recipient.name)
            )
            results.append(success)
        }
        
        return results
    }
    
    private func personalizeMessage(_ message: String, for name: String) -> String {
        return message.replacingOccurrences(of: "{{name}}", with: name)
    }
    
    private func createEmailInMailApp(to: String, subject: String, body: String) -> Bool {
        // Encode the email components
        guard let encodedTo = to.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let mailtoURL = URL(string: "mailto:\(encodedTo)?subject=\(encodedSubject)&body=\(encodedBody)") else {
            return false
        }
        
        // Open the URL in Mail.app
        NSWorkspace.shared.open(mailtoURL)
        
        // Small delay to prevent overwhelming the system
        Thread.sleep(forTimeInterval: 0.5)
        
        return true
    }
}
