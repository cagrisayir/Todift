//
//  AuthViewModel.swift
//  Todift
//
//  Created by Omer Cagri Sayir on 24.01.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // Firebase Auth User
    @Published var currentUser: User? // My user

    init() {
        userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
    }

    func login(withEmail email: String, password: String) async throws {
        do {
            let response = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = response.user

            await fetchUser()
        } catch {
            print("Error while login \(error.localizedDescription)")
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)

            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
            currentUser = nil
        } catch {
            print("Error during SignOut: \(error.localizedDescription)")
        }
    }
}

protocol AuthFormProtocol {
    var formIsValid: Bool { get }
}

// MARK: Validation

extension LoginView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

extension RegisterView: AuthFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
            && email.contains("@")
            && !password.isEmpty
            && password.count > 5
            && password == confirmPassword
            && !fullname.isEmpty
    }
}
