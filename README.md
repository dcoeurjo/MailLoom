# publiMacOS - Email Sender App

A macOS application for sending personalized emails to multiple recipients using Mail.app. Import recipient data from a CSV spreadsheet, customize messages, and send emails efficiently.

## Features

- **CSV Import**: Import recipient data from CSV files
- **Message Personalization**: Use `{{name}}` placeholder to personalize messages
- **Individual Message Editing**: Customize messages for each recipient
- **Selective Sending**: Choose which recipients to send emails to
- **Mail.app Integration**: Creates draft emails in Mail.app for review before sending

## Requirements

- macOS 13.0 or later
- Xcode 15.0 or later
- Swift 5.0
- Mail.app configured with an email account

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dcoeurjo/publiMacOS.git
   cd publiMacOS
   ```

2. Open the project in Xcode:
   ```bash
   open EmailSender.xcodeproj
   ```

3. Build and run the project (⌘R)

## Usage

1. **Prepare your CSV file** with the following format:
   ```csv
   name,email,message
   John Doe,john.doe@example.com,"Dear {{name}}, This is your message."
   Jane Smith,jane.smith@example.com,"Hi {{name}}, Hope you're well."
   ```

2. **Launch the app** and click "Import Spreadsheet (CSV)"

3. **Select your CSV file** containing recipient data

4. **Edit the default message** if needed (use `{{name}}` as a placeholder)

5. **Review recipients** - expand individual entries to customize their messages

6. **Select recipients** using checkboxes

7. **Click "Send Emails"** - the app will create draft emails in Mail.app

## CSV Format

The CSV file should have three columns:
- `name`: Recipient's name (required)
- `email`: Recipient's email address (required)
- `message`: Custom message for the recipient (optional)

The first row should be a header row with column names.

## Message Personalization

Use the `{{name}}` placeholder in your message template, and it will be automatically replaced with each recipient's name when creating the emails.

Example:
```
Dear {{name}},

I hope this message finds you well...
```

## Sample Data

A sample CSV file (`sample_recipients.csv`) is included in the repository for testing.

## Architecture

The app is built with SwiftUI and consists of:
- **EmailSenderApp.swift**: Main app entry point
- **ContentView.swift**: User interface with recipient list and message editor
- **SpreadsheetParser.swift**: CSV file parsing logic
- **EmailService.swift**: Mail.app integration using mailto URLs

## Security

The app uses App Sandbox with the following capabilities:
- Read-only access to user-selected files
- Network client access (for mailto URLs)

## License

This project is open source and available under standard terms.