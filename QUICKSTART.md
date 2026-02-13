# Quick Start Guide

## What This App Does

EmailSender is a macOS application that:
1. Imports recipient data from CSV spreadsheets
2. Lets you write and personalize messages for each recipient
3. Creates email drafts in Mail.app for each recipient
4. Supports bulk email creation with individual customization

## 5-Minute Quick Start

### 1. Open the Project in Xcode
```bash
open EmailSender.xcodeproj
```

### 2. Build and Run
- Press ⌘R or click the Run button in Xcode
- The app will launch in a new window

### 3. Try the Sample Data
- Click "Import Spreadsheet (CSV)"
- Select the included `sample_recipients.csv` file
- You'll see 4 sample recipients loaded

### 4. Customize the Message
- Edit the default message template
- Notice the `{{name}}` placeholder - it gets replaced with each recipient's name
- Try changing the message and watch all recipients update

### 5. Send Test Emails
- Keep all recipients selected (or uncheck some if you want)
- Click "Send Emails"
- Mail.app will open with draft emails for each recipient
- Review and send them manually from Mail.app

## CSV File Format

Create a file with these columns:
```
name,email,message
```

Example:
```csv
name,email,message
John Doe,john.doe@example.com,"Hi {{name}}, this is a test."
Jane Smith,jane.smith@example.com,"Hello {{name}}, hope you're well."
```

## Key Features to Try

### Message Personalization
Use `{{name}}` in your message - it will be replaced with the recipient's actual name.

### Individual Customization
1. Click the chevron (▼) next to any recipient
2. Edit their message individually
3. This only affects that one recipient

### Selective Sending
1. Uncheck recipients you don't want to email
2. The "Send Emails" button shows how many will be sent
3. Only checked recipients receive emails

## How It Works

The app uses the `mailto:` URL scheme to open Mail.app with pre-filled email drafts. This means:
- ✅ You review each email before sending
- ✅ You can make final edits in Mail.app
- ✅ Your email signature is added automatically
- ✅ Emails are sent from your configured Mail.app account

## Testing Tips

1. Start with the sample CSV file to understand the format
2. Test with 2-3 recipients first
3. Check that Mail.app is configured before using
4. Use your own email as a recipient for testing

## Project Structure

```
EmailSender/
├── EmailSenderApp.swift     # App entry point
├── ContentView.swift         # Main UI
├── SpreadsheetParser.swift   # CSV parsing
├── EmailService.swift        # Mail.app integration
└── Assets.xcassets/          # App icons and assets
```

## Common Questions

**Q: Does it send emails automatically?**
A: No. It creates drafts in Mail.app that you send manually.

**Q: What if I have many recipients?**
A: The app adds a 0.5-second delay between creating drafts to avoid overwhelming the system.

**Q: Can I use Excel files?**
A: Save your Excel file as CSV first (File → Save As → CSV).

**Q: What about attachments?**
A: Add them manually in Mail.app before sending.

**Q: Can I customize the subject line?**
A: The current version uses "Message for [Name]" as the subject. You can modify this in EmailService.swift.

## Next Steps

- Modify the code to add custom features
- Update EmailService.swift to change the subject line format
- Enhance ContentView.swift to add more UI features
- Add support for Excel files directly

## Support

For issues or questions, please refer to:
- README.md for detailed documentation
- USER_GUIDE.md for comprehensive usage instructions
- The source code comments for implementation details
