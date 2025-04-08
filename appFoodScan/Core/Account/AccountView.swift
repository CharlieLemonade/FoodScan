//
//  AccountView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct AccountView: View {
    
    @State private var showLogoutConfirmation = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)        .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        
                        HStack {
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Upgrade Plan Now!")
                                    .fontWeight(.bold)
                                Text("Enjoy all the benefits and explore more possibilities")
                                    .font(.caption)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(AppColors.primary)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // User Profile
                        HStack {
                            Image("profile_placeholder") // reemplaza con la imagen real
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("Andrew Ainsley")
                                    .fontWeight(.semibold)
                                Text("andrew.ainsley@yourdomain.com")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Trackers
                        VStack(spacing: 1) {
                            AccountRow(icon: "flame", label: "Calorie Counter")
                            AccountRow(icon: "drop", label: "Water Tracker")
                            AccountRow(icon: "figure.walk", label: "Step Counter")
                            AccountRow(icon: "scalemass", label: "Weight Tracker")
                            AccountRow(icon: "gearshape", label: "Preferences")
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Settings
                        VStack(spacing: 1) {
                            AccountRow(icon: "bell", label: "Notification")
                            AccountRow(icon: "creditcard", label: "Payment Methods")
                            AccountRow(icon: "doc.plaintext", label: "Billing & Subscriptions")
                            AccountRow(icon: "lock.shield", label: "Account & Security")
                            AccountRow(icon: "arrow.left.arrow.right", label: "Linked Accounts")
                            AccountRow(icon: "eye", label: "App Appearance")
                            AccountRow(icon: "chart.bar.doc.horizontal", label: "Data & Analytics")
                            AccountRow(icon: "questionmark.circle", label: "Help & Support")
                            AccountRow(icon: "star", label: "Rate us")
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        // Logout
                        Button(action: {
                            showLogoutConfirmation = true
                        }) {
                            HStack {
                                Image(systemName: "arrow.right.square")
                                Text("Logout")
                            }
                            .foregroundColor(.red)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .alert("¿Estás seguro que deseas cerrar sesión?", isPresented: $showLogoutConfirmation) {
                            Button("Cancelar", role: .cancel) { }
                            Button("Cerrar sesión", role: .destructive) {
                                AuthService.shared.signOut()
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("LogoFoodScanSecondary")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                }
            }
        }
    }
}

struct AccountRow: View {
    let icon: String
    let label: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
            Text(label)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

#Preview {
    AccountView()
}

