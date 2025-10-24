import SwiftUI

struct TokenStorageDemo: View {
    @State private var token: String = ""
    @State private var savedToken: String? = nil

    var body: some View {
        VStack(spacing: 20) {

            TextField("Enter token", text: $token)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Save Token") {
                // ✅ Secure: saves token into the Keychain
                KeychainHelper.save(token, forKey: "authToken")
                savedToken = KeychainHelper.load(forKey: "authToken")
            }
            .buttonStyle(.borderedProminent)

            if let saved = savedToken {
                VStack(spacing: 8) {
                    Text("Saved token: \(saved)")
                        .font(.subheadline)
                        .foregroundColor(.green)

                    Text(
                        """
                        🔒 Stored in iOS Keychain.
                        You will NOT see this token in:
                        ~/Library/Developer/CoreSimulator/Devices/<DeviceUUID>/data/Containers/Data/Application/<AppUUID>/Library/Preferences
                        """
                    )
                    .font(.system(.caption, design: .monospaced))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
            } else {
                Text("No token currently stored.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Token Storage (Secure)")
        .onAppear {
            // Check if a token already exists
            savedToken = KeychainHelper.load(forKey: "authToken")
        }
    }
}
