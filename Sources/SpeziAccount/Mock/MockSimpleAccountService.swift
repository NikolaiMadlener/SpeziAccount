//
// This source file is part of the Spezi open-source project
//
// SPDX-FileCopyrightText: 2023 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


/// The view style for the `MockSimpleAccountService` rendering `"Hello World"` text.
struct MockSimpleAccountSetupViewStyle: AccountSetupViewStyle {
    var service: MockSimpleAccountService


    init(using service: MockSimpleAccountService) {
        self.service = service
    }


    func makePrimaryView() -> some View {
        Text("Hello World")
    }
}


/// A simple mock ``AccountService`` that is barely implemented but useful for SwiftUI previewing purposes.
actor MockSimpleAccountService: AccountService {
    @AccountReference private var account: Account
    
    let configuration = AccountServiceConfiguration(name: "Mock Simple AccountService", supportedKeys: .arbitrary)


    nonisolated var viewStyle: some AccountSetupViewStyle {
        MockSimpleAccountSetupViewStyle(using: self)
    }


    init() {}


    func signUp(signupDetails: SignupDetails) async throws {
        print("Signup: \(signupDetails)")
    }

    func logout() async throws {
        print("Logout")
    }

    func delete() async throws {
        print("Remove")
    }

    func updateAccountDetails(_ modifications: AccountModifications) async throws {
        print("Modifications: \(modifications)")
    }
}
