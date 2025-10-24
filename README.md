# Secure Security UX Demos

This project contains **secure, user-friendly implementations** of the same demo flows.  
Each screen demonstrates a better practice that improves both UX and security.

## Screens

- **Login**

  - Password is masked (`SecureField`)
  - Error messages use generic wording (“Invalid email or password”)

- **Contacts**

  - Requests permission only after explicit user action
  - Provides context before showing system dialog

- **Delete**

  - Requires confirmation with an alert before destructive action
  - Cancel option is safe default

- **Token Storage**

  - Session token saved in iOS Keychain
  - Not present in `.plist` files or app container
  - Encrypted and managed by the system, resistant to extraction

- **OTP**
  - Uses `SecureField` with `.textContentType = .oneTimeCode`
  - iOS can autofill codes from SMS/Mail
  - Code masked to reduce shoulder-surfing risk

## Learning Goals

- See how small UX changes can drastically improve perceived and real security
- Learn iOS patterns for secure text entry, permissions, and error handling
- Understand that "secure" often also means **clearer and more user-friendly**
