//
//  OTPDemoView.swift
//  m0secure
//
//  Created by Jonathan Mazin on 2025-10-06.
//


import SwiftUI

struct OTPDemoView: View {
    @State private var code = ""
    @State private var status = ""

    var body: some View {
        Form {
            Section(header: Text("OTP Entry")) {
                // ✅ SecureField masks input
                // ✅ One-time code hint for iOS autofill
                SecureField("Enter 6-digit code", text: $code)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
            }

            Button("Verify") {
                verify()
            }

            if !status.isEmpty {
                Section(header: Text("Status")) {
                    Text(status)
                        .foregroundColor(status.contains("success") ? .green : .red)
                        .font(.system(.body, design: .monospaced))
                }
            }
        }
        .navigationTitle("OTP Demo")
    }

    func verify() {
        let realCode = "123456" // hardcoded for demo
        if code == realCode {
            status = "Verification success ✅"
        } else {
            status = "Verification failed ❌"
        }
    }
}
