# EmailSender App - User Guide

## Overview
The EmailSender app is a macOS application designed to help you send personalized emails to multiple recipients efficiently using Mail.app.

## Getting Started

### Step 1: Launch the Application
When you first open the app, you'll see the main window with:
- A title "Email Sender" at the top
- An "Import Spreadsheet (CSV)" button (blue)
- Instructions for getting started

### Step 2: Prepare Your CSV File
Create a CSV file with the following structure:
```csv
name,email,message
John Doe,john.doe@example.com,"Dear {{name}}, This is your message."
Jane Smith,jane.smith@example.com,"Hi {{name}}, Hope you're well."
```

**Important Notes:**
- First row must be headers: `name,email,message`
- `name` and `email` are required
- `message` is optional - you can set a default for all recipients
- Use `{{name}}` as a placeholder that will be replaced with each recipient's name

### Step 3: Import Recipients
1. Click the "Import Spreadsheet (CSV)" button
2. Select your CSV file from the file picker
3. The app will display a success message showing how many recipients were imported

### Step 4: Customize the Message
After importing, you'll see:
- A "Default Message Template" text area at the top
- This message will be applied to all recipients
- You can use `{{name}}` to personalize the message
- Any changes to this template will update all recipient messages

### Step 5: Review Recipients
The recipient list shows:
- Checkbox for each recipient (checked by default)
- Name and email address
- Expand/collapse button (chevron icon) to view/edit individual messages
- When expanded, you can customize the message for that specific recipient

### Step 6: Send Emails
1. Review the count of selected recipients (shown on the Send button)
2. Click "Send Emails (N)" where N is the number of selected recipients
3. The app will create individual email drafts in Mail.app
4. Each email will open in Mail.app for final review before sending

**Note:** The app creates drafts in Mail.app rather than sending directly. This gives you the opportunity to:
- Review each email before sending
- Make final adjustments if needed
- Verify recipients one last time

## Features in Detail

### Message Personalization
The `{{name}}` placeholder is automatically replaced with each recipient's name. For example:
- Template: "Dear {{name}}, thank you for your time."
- For "John Doe": "Dear John Doe, thank you for your time."

### Selective Sending
- Use checkboxes to select/deselect recipients
- The send button shows the count of selected recipients
- Only selected recipients will receive emails

### Individual Message Customization
- Click the chevron icon next to any recipient to expand their details
- Edit the message for that specific recipient
- Changes won't affect other recipients

### Safety Features
- All emails are created as drafts in Mail.app
- You can review each email before sending
- No emails are sent automatically
- App Sandbox ensures secure file access

## Troubleshooting

### "Unable to access the file"
- Make sure you're selecting a valid CSV file
- Check file permissions

### "No valid recipients found"
- Verify your CSV has the correct format
- Ensure the first row contains headers
- Check that name and email columns are not empty

### Emails not opening in Mail.app
- Verify Mail.app is installed and configured
- Check that you have at least one email account set up in Mail.app

## Tips for Best Results

1. **Test First**: Use the sample_recipients.csv file to test the app before importing your actual data
2. **Preview Messages**: Always expand a few recipients to preview how messages look
3. **Save Your CSV**: Keep a backup of your CSV file for future use
4. **Batch Processing**: For large lists, consider sending in smaller batches
5. **Message Length**: Keep messages concise - very long messages may have issues with mailto URLs

## Technical Details

- **Supported File Format**: CSV (Comma-Separated Values)
- **Encoding**: UTF-8
- **Platform**: macOS 13.0 or later
- **Email Method**: mailto URLs opened in Mail.app
- **Delay Between Emails**: 0.5 seconds to prevent system overload

## Sample CSV

The repository includes `sample_recipients.csv` with example data. Use it to:
- Test the app functionality
- Understand the correct CSV format
- See how message personalization works
