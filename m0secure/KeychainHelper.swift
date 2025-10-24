import Foundation  // ✅ Provides Data, String, etc.
import Security  // ✅ Gives access to Keychain Services API

struct KeychainHelper {

    // Save a string into the Keychain
    static func save(_ value: String, forKey key: String) {
        let data = Data(value.utf8)  // 🔑 Convert the string into raw Data

        // Step 1: Build a query that describes the item
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // We're storing a generic password
            kSecAttrAccount as String: key,  // Key = identifier for this item
        ]

        // Step 2: Delete any existing item with this key
        SecItemDelete(query as CFDictionary)

        // Step 3: Add the new item to Keychain
        let addQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // Same class of item
            kSecAttrAccount as String: key,  // Same key
            kSecValueData as String: data,  // The actual data to store
        ]
        SecItemAdd(addQuery as CFDictionary, nil)
    }

    // Load a string from the Keychain
    static func load(forKey key: String) -> String? {
        // Step 1: Build a query that asks Keychain for an item
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // Look for generic password items
            kSecAttrAccount as String: key,  // Match this specific key
            kSecReturnData as String: true,  // Ask for the data value back
            kSecMatchLimit as String: kSecMatchLimitOne,  // Only one match expected
        ]

        var item: CFTypeRef? = nil

        // Step 2: Perform the lookup
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        // Step 3: Check result
        guard status == errSecSuccess,  // Success?
            let data = item as? Data,  // Got Data back?
            let value = String(data: data, encoding: .utf8)  // Decode to String
        else {
            return nil  // ❌ Not found or couldn’t decode
        }

        return value  // ✅ Found token as String
    }
}
