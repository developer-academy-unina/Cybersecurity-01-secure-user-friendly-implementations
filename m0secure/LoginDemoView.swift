import SwiftUI

struct LoginDemoView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var statusText = ""

    var body: some View {
        Form {
            Section(header: Text("Login")) {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
            }

            Button("Login") {
                login()
            }

            if !statusText.isEmpty {
                Section(header: Text("Status")) {
                    Text(statusText)
                        .foregroundColor(
                            statusText.contains("success") ? .green : .red
                        )
                        .font(.system(.body, design: .monospaced))
                }
            }
        }
        .navigationTitle("Login Demo")
    }

    func login() {
        // Hardcoded correct values for demo
        let realEmail = "user@example.com"
        let realPassword = "Password123"

        if email == realEmail && password == realPassword {
            statusText = "Login success ✅"
        } else {
            // ✅ Secure: no user enumeration
            statusText = "Invalid email or password"
        }
    }
}
