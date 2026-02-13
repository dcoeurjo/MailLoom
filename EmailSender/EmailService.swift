import Foundation
import AppKit

class EmailService {
    func sendEmails(to recipients: [Recipient], completion: @escaping ([Bool]) -> Void) {
        var results: [Bool] = []
        
        // Send emails asynchronously to avoid blocking the UI
        DispatchQueue.global(qos: .userInitiated).async {
            for recipient in recipients {
                let success = self.createEmailInMailApp(
                    to: recipient.email,
                    subject: "Message for \(recipient.name)",
                    body: self.personalizeMessage(recipient.message, for: recipient.name)
                )
                results.append(success)
                
                // Small delay to prevent overwhelming the system
                Thread.sleep(forTimeInterval: 0.5)
            }
            
            // Call completion handler on main thread
            DispatchQueue.main.async {
                completion(results)
            }
        }
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
        
        // Open the URL in Mail.app (must be called on main thread)
        DispatchQueue.main.sync {
            NSWorkspace.shared.open(mailtoURL)
        }
        
        return true
    }
}
