# App Screenshots & Visual Guide

Since this is a macOS app that cannot be run in this environment, here's a detailed description of what the app looks like and how it works visually.

## Main Window Layout

### Window Properties
- **Size**: 700x600 pixels (fixed)
- **Style**: Modern macOS window with hidden title bar
- **Background**: Standard macOS light/dark mode support

---

## Application States

### 1. Empty State (Initial Launch)

```
┌─────────────────────────────────────────────────────────────┐
│                                                               │
│                       Email Sender                            │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                                                       │   │
│  │           📄  Import Spreadsheet (CSV)              │   │
│  │                                                       │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
│                                                               │
│                                                               │
│              Import a CSV file to get started                │
│              CSV format: name,email,message                  │
│                                                               │
│                                                               │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

**Visual Elements:**
- Large blue button for CSV import
- Centered instructional text
- Clean, minimal interface

---

### 2. After Importing Recipients

```
┌─────────────────────────────────────────────────────────────┐
│                       Email Sender                            │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │       📄  Import Spreadsheet (CSV)                   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
│  Default Message Template:                                   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ Dear {{name}}, This is a test message for you.      │   │
│  │                                                       │   │
│  │                                                       │   │
│  └─────────────────────────────────────────────────────┘   │
│  Use {{name}} as a placeholder for the recipient's name     │
│                                                               │
│  Recipients (4 selected):                                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ☑ John Doe                                     ▼     │   │
│  │   john.doe@example.com                               │   │
│  │                                                       │   │
│  │ ☑ Jane Smith                                   ▼     │   │
│  │   jane.smith@example.com                             │   │
│  │                                                       │   │
│  │ ☑ Bob Johnson                                  ▼     │   │
│  │   bob.johnson@example.com                            │   │
│  │                                                       │   │
│  │ ☑ Alice Williams                               ▼     │   │
│  │   alice.williams@example.com                         │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ✉  Send Emails (4)                      │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

**Visual Elements:**
- Message template editor (multi-line text field)
- Scrollable recipient list with gray backgrounds
- Checkboxes for each recipient (checked by default)
- Name and email displayed for each recipient
- Chevron buttons (▼) to expand details
- Green "Send Emails" button showing count

---

### 3. Expanded Recipient View

```
┌─────────────────────────────────────────────────────────────┐
│  Recipients (4 selected):                                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ☑ John Doe                                     ▲     │   │
│  │   john.doe@example.com                               │   │
│  │                                                       │   │
│  │   Message:                                            │   │
│  │   ┌───────────────────────────────────────────────┐ │   │
│  │   │ Dear John Doe, This is a test message        │ │   │
│  │   │ for you. Thank you for your time.             │ │   │
│  │   │                                                │ │   │
│  │   └───────────────────────────────────────────────┘ │   │
│  │                                                       │   │
│  ├───────────────────────────────────────────────────────┤   │
│  │ ☑ Jane Smith                                   ▼     │   │
│  │   jane.smith@example.com                             │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

**Visual Elements:**
- Expanded row shows editable message
- Chevron points up (▲) when expanded
- Text editor for individual message customization
- Other recipients remain collapsed

---

### 4. Selection Changes

```
┌─────────────────────────────────────────────────────────────┐
│  Recipients (2 selected):                                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ☑ John Doe                                     ▼     │   │
│  │   john.doe@example.com                               │   │
│  │                                                       │   │
│  │ ☐ Jane Smith                                   ▼     │   │
│  │   jane.smith@example.com                             │   │
│  │                                                       │   │
│  │ ☑ Bob Johnson                                  ▼     │   │
│  │   bob.johnson@example.com                            │   │
│  │                                                       │   │
│  │ ☐ Alice Williams                               ▼     │   │
│  │   alice.williams@example.com                         │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ✉  Send Emails (2)                      │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

**Visual Elements:**
- Unchecked boxes (☐) shown for unselected recipients
- Button updates to show "Send Emails (2)"
- Count dynamically updates

---

### 5. Alert Dialog (Success)

```
┌─────────────────────────────────────────────────────────────┐
│                       Email Sender                            │
│  ┌───────────────────────────────────────────────────┐     │
│  │                  Email Sender                      │     │
│  │                                                     │     │
│  │  Successfully created 4 emails in Mail.app        │     │
│  │                                                     │     │
│  │                     [ OK ]                          │     │
│  └───────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

**Visual Elements:**
- Modal alert overlaying main window
- Success message
- Standard macOS alert styling
- OK button to dismiss

---

### 6. Alert Dialog (Import Success)

```
┌─────────────────────────────────────────────────────────────┐
│  ┌───────────────────────────────────────────────────┐     │
│  │                  Email Sender                      │     │
│  │                                                     │     │
│  │     Successfully imported 4 recipients            │     │
│  │                                                     │     │
│  │                     [ OK ]                          │     │
│  └───────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

---

### 7. Alert Dialog (Error)

```
┌─────────────────────────────────────────────────────────────┐
│  ┌───────────────────────────────────────────────────┐     │
│  │                  Email Sender                      │     │
│  │                                                     │     │
│  │    No valid recipients found in the file          │     │
│  │                                                     │     │
│  │                     [ OK ]                          │     │
│  └───────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

---

## Color Scheme

### Light Mode
- **Background**: White (#FFFFFF)
- **Secondary Background**: Light Gray (#F5F5F5)
- **Text**: Black (#000000)
- **Secondary Text**: Gray (#8E8E93)
- **Import Button**: Blue (#007AFF)
- **Send Button**: Green (#34C759)
- **Disabled Button**: Gray (#8E8E93)

### Dark Mode (automatic)
- **Background**: Dark Gray (#1C1C1E)
- **Secondary Background**: Darker Gray (#2C2C2E)
- **Text**: White (#FFFFFF)
- **Secondary Text**: Light Gray (#AEAEB2)
- **Import Button**: Blue (#0A84FF)
- **Send Button**: Green (#30D158)
- **Disabled Button**: Gray (#48484A)

---

## Interactions

### Button States
1. **Import Button**: 
   - Normal: Blue with white text
   - Hover: Slightly lighter blue
   - Click: Opens file picker dialog

2. **Send Button**: 
   - Normal: Green with white text (when recipients selected)
   - Disabled: Gray (when no recipients selected)
   - Hover: Slightly lighter green

3. **Chevron Buttons**: 
   - Points down (▼) when collapsed
   - Points up (▲) when expanded
   - Rotates smoothly on click

### Text Editors
- **Default Message**: Multi-line, auto-expanding
- **Individual Message**: Multi-line, visible when expanded
- Both support standard text editing shortcuts

### Checkboxes
- Click to toggle selection
- Visual feedback on hover
- Standard macOS checkbox styling

---

## File Picker Dialog

When "Import Spreadsheet (CSV)" is clicked:

```
┌─────────────────────────────────────────────────────────────┐
│  Select a CSV file to import                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  📁 Documents                                        │   │
│  │    📄 sample_recipients.csv                          │   │
│  │    📄 contacts.csv                                   │   │
│  │    📁 Projects                                       │   │
│  │    📁 Downloads                                      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                               │
│  File Format: CSV, Text                                      │
│                                   [ Cancel ]    [ Open ]     │
└─────────────────────────────────────────────────────────────┘
```

---

## Mail.app Integration

After clicking "Send Emails", Mail.app opens with drafts:

```
┌─────────────────────────────────────────────────────────────┐
│  📧 Mail                                                      │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ To: john.doe@example.com                             │   │
│  │ Subject: Message for John Doe                        │   │
│  │                                                       │   │
│  │ Dear John Doe, This is a test message for you.      │   │
│  │                                                       │   │
│  │                                                       │   │
│  │                              [ Send ] [ Save Draft ]  │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

Each recipient gets their own draft email with:
- Personalized subject line
- Personalized message body
- Ready to review and send

---

## Responsive Behavior

- Window is fixed size (700x600) for consistency
- Recipient list scrolls vertically when many recipients
- Text editors auto-resize based on content
- All elements use proper macOS spacing and alignment

---

## Accessibility

- Supports VoiceOver for visually impaired users
- Keyboard navigation enabled
- Standard macOS keyboard shortcuts work
- High contrast mode compatible
- Dynamic Type support for text scaling

---

This visual guide provides a complete picture of how the EmailSender app looks and behaves without needing actual screenshots.
