<div align="center">
  <h3>Workshop</h3>
  <h1>
      Cybersecurity 01 - Secure Security UX Demos<br />
  </h1>
  <br />
</div>

<br />

<p align="center">
  <a href="#" alt="Version">
    <img src="https://img.shields.io/static/v1?label=Version&message=1.0.0&color=brightgreen" />
  </a>
  <a href="#" alt="XCode Version">
    <img src="https://img.shields.io/static/v1?label=XCode%20Version&message=26.0&color=brightgreen&logo=xcode" />
  </a>        
  <a href="#" alt="Swift Version">
    <img src="https://img.shields.io/static/v1?label=Swift%20Version&message=6.0&color=brightgreen&logo=swift" />
  </a>
  <a href="#" alt="Framework used">
    <img src="https://img.shields.io/static/v1?label=Framework%20used&message=SwiftUI&color=brightgreen&logo=swift">
  </a>          
</p>

---

## About

In this repository, you will explore how thoughtful design choices in user experience (UX) can **enhance security** without compromising usability.  

This project contains **secure, user-friendly implementations** of the same demo flows of "Cybersecurity 01 - Insecure Security UX Demos".  
Each screen demonstrates a better practice that improves both UX and security.


## Learning Goals

In this repository, you will:
- See how small UX changes can drastically improve perceived and real security
- Learn iOS patterns for secure text entry, permissions, and error handling
- Understand that "secure" often also means **clearer and more user-friendly**


### Screens Demonstrated

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

## Getting Started

### Installation

To get access to the project created during the workshop, you can [download the repository as a zip file](https://github.com/developer-academy-unina/Cybersecurity-01-secure-user-friendly-implementations/archive/refs/heads/main.zip) and access the project.

<br />
