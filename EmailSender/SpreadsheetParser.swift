import Foundation

class SpreadsheetParser {
    func parseCSV(from url: URL) -> [Recipient] {
        var recipients: [Recipient] = []
        
        do {
            let content = try String(contentsOf: url, encoding: .utf8)
            let lines = content.components(separatedBy: .newlines)
            
            // Skip header if it exists
            let dataLines = lines.dropFirst()
            
            for line in dataLines {
                // Skip empty lines
                if line.trimmingCharacters(in: .whitespaces).isEmpty {
                    continue
                }
                
                let components = parseCSVLine(line)
                
                // Expect at least name and email
                guard components.count >= 2 else {
                    continue
                }
                
                let name = components[0].trimmingCharacters(in: .whitespaces)
                let email = components[1].trimmingCharacters(in: .whitespaces)
                
                // Skip if name or email is empty
                guard !name.isEmpty && !email.isEmpty else {
                    continue
                }
                
                // Get message if available, otherwise use empty string
                let message = components.count >= 3 
                    ? components[2].trimmingCharacters(in: .whitespaces)
                    : ""
                
                let recipient = Recipient(name: name, email: email, message: message)
                recipients.append(recipient)
            }
        } catch {
            print("Error reading CSV file: \(error)")
        }
        
        return recipients
    }
    
    private func parseCSVLine(_ line: String) -> [String] {
        var components: [String] = []
        var currentField = ""
        var insideQuotes = false
        
        for char in line {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == "," && !insideQuotes {
                components.append(currentField)
                currentField = ""
            } else {
                currentField.append(char)
            }
        }
        
        // Add the last field
        components.append(currentField)
        
        return components
    }
}
