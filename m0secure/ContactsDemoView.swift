import Contacts
import SwiftUI

struct ContactsDemoView: View {
    @State private var permissionResult = "Not requested yet"

    var body: some View {
        VStack(spacing: 20) {


            Text("✅ Asks for contacts access only after user taps button.")

            Button("Request Contacts Access") {
                requestContacts()
            }
            .buttonStyle(.borderedProminent)

            Text(permissionResult)
                .foregroundColor(.green)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Contacts Demo")
    }

    func requestContacts() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    permissionResult = "Contacts access granted ✅"
                } else {
                    permissionResult = "Contacts access denied ❌"
                }
            }
        }
    }
}
