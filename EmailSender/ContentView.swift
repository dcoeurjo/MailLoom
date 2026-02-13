import SwiftUI
import UniformTypeIdentifiers

struct Recipient: Identifiable, Codable {
    let id = UUID()
    var name: String
    var email: String
    var message: String
    var selected: Bool = true
}

struct ContentView: View {
    @State private var recipients: [Recipient] = []
    @State private var defaultMessage: String = ""
    @State private var isImporting = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Email Sender")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Import Button
            Button(action: {
                isImporting = true
            }) {
                HStack {
                    Image(systemName: "doc.text")
                    Text("Import Spreadsheet (CSV)")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [.commaSeparatedText, .text],
                allowsMultipleSelection: false
            ) { result in
                handleFileImport(result)
            }
            .padding(.horizontal)
            
            if !recipients.isEmpty {
                // Default Message Editor
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default Message Template:")
                        .font(.headline)
                    
                    TextEditor(text: $defaultMessage)
                        .frame(height: 100)
                        .border(Color.gray.opacity(0.5))
                        .onChange(of: defaultMessage) { newValue in
                            updateAllMessages(newValue)
                        }
                    
                    Text("Use {{name}} as a placeholder for the recipient's name")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Recipients List
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recipients (\(recipients.filter { $0.selected }.count) selected):")
                        .font(.headline)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach($recipients) { $recipient in
                                RecipientRow(recipient: $recipient)
                            }
                        }
                    }
                    .frame(maxHeight: 300)
                    .border(Color.gray.opacity(0.3))
                }
                .padding(.horizontal)
                
                // Send Button
                Button(action: sendEmails) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Send Emails (\(recipients.filter { $0.selected }.count))")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(recipients.filter { $0.selected }.isEmpty ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .disabled(recipients.filter { $0.selected }.isEmpty)
                .padding(.horizontal)
            } else {
                Spacer()
                
                Text("Import a CSV file to get started")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text("CSV format: name,email,message")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(width: 700, height: 600)
        .alert("Email Sender", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
    
    func handleFileImport(_ result: Result<[URL], Error>) {
        do {
            guard let selectedFile = try result.get().first else { return }
            
            // Start accessing a security-scoped resource
            guard selectedFile.startAccessingSecurityScopedResource() else {
                alertMessage = "Unable to access the file"
                showAlert = true
                return
            }
            
            defer { selectedFile.stopAccessingSecurityScopedResource() }
            
            let parser = SpreadsheetParser()
            recipients = parser.parseCSV(from: selectedFile)
            
            if recipients.isEmpty {
                alertMessage = "No valid recipients found in the file"
                showAlert = true
            } else {
                // Set default message from first recipient if available
                if let firstMessage = recipients.first?.message, !firstMessage.isEmpty {
                    defaultMessage = firstMessage
                }
                alertMessage = "Successfully imported \(recipients.count) recipients"
                showAlert = true
            }
        } catch {
            alertMessage = "Error importing file: \(error.localizedDescription)"
            showAlert = true
        }
    }
    
    func updateAllMessages(_ newMessage: String) {
        for index in recipients.indices {
            recipients[index].message = newMessage
        }
    }
    
    func sendEmails() {
        let selectedRecipients = recipients.filter { $0.selected }
        
        if selectedRecipients.isEmpty {
            alertMessage = "Please select at least one recipient"
            showAlert = true
            return
        }
        
        let emailService = EmailService()
        let results = emailService.sendEmails(to: selectedRecipients)
        
        let successCount = results.filter { $0 }.count
        let failureCount = results.count - successCount
        
        if failureCount == 0 {
            alertMessage = "Successfully created \(successCount) emails in Mail.app"
        } else {
            alertMessage = "Created \(successCount) emails. Failed: \(failureCount)"
        }
        showAlert = true
    }
}

struct RecipientRow: View {
    @Binding var recipient: Recipient
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Toggle("", isOn: $recipient.selected)
                    .labelsHidden()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(recipient.name)
                        .font(.headline)
                    Text(recipient.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: { isExpanded.toggle() }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Message:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextEditor(text: $recipient.message)
                        .frame(height: 80)
                        .border(Color.gray.opacity(0.5))
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    ContentView()
}
