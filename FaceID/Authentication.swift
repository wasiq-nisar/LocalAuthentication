//
//  Authentication.swift
//  FaceID
//
//  Created by Muhammad Wasiq  on 21/12/2023.
//

import Foundation
import LocalAuthentication

class Authentication {
    static let shared = Authentication()
    private init() {}
    
    let context = LAContext()
    var error: NSError?
    
    func isFaceIDAvailable() -> Bool {
        let context = LAContext()

        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // Biometric authentication is available (Touch ID or Face ID)
            if #available(iOS 11.0, *) {
                switch context.biometryType {
                case .faceID:
                    // If FaceID is enabled
                    print("Face ID is available and enabled.")
                    return true
                case .touchID:
                    // If TouchID is enabled
                    print("Touch ID is available and enabled.")
                    return false
                @unknown default:
                    // Handle any future cases that might be introduced
                    print("Unhandled biometryType case")
                    return false
                }
            } else {
                // Fallback on earlier versions
                // If you are developing for iOS versions earlier than 11.0, the LAContext.biometryType property may not be available. In that case, you can use the canEvaluatePolicy method with LAPolicy.deviceOwnerAuthenticationWithBiometrics to determine whether any biometric authentication is available.
                print("Biometry is available (Touch ID).")
                return false
            }
        } else {
            // Biometric authentication is not available
            print("Biometric authentication is not available.")
            return false
        }
    }
}
