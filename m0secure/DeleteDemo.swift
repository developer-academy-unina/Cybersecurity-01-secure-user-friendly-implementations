import SwiftUI

struct DeleteDemo: View {
    @State private var status = ""
    @State private var showConfirm = false

    var body: some View {
        VStack(spacing: 20) {

            Button("Delete Account") {
                // ✅ Ask first
                showConfirm = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .alert("Are you sure?", isPresented: $showConfirm) {
                Button("Cancel", role: .cancel) {}
                Button("Delete", role: .destructive) {
                    status = "Account deleted ✅"
                }
            } message: {
                Text("This action cannot be undone.")
            }

            Text(status)
                .foregroundColor(.green)

            Spacer()
        }
        .padding()
        .navigationTitle("Delete Demo")
    }
}
