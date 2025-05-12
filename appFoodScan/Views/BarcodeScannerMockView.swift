//
//  BarcodeScannerMockView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct BarcodeScannerMockView: View {
    @Environment(\.dismiss) var dismiss
    @State private var scannedCode: String? = nil

    var body: some View {
        ZStack {
            // Fondo simulado
            Color.gray
                .ignoresSafeArea()
            
            ScannerCornerOverlay()
            
            VStack {
                // Encabezado
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .padding()
                            .foregroundStyle(.white)
                    }

                    Spacer()

                    Text("Scan Barcode")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {
                        dismiss() // O alguna otra acción
                    }) {
                        Image(systemName: "bolt.slash")
                            .font(.title2)
                            .padding()
                            .foregroundStyle(.white)
                    }
                }
                .padding(.horizontal, 5)
                .padding(.top, 15)

                Spacer()

                if let code = scannedCode {
                    Text("Código escaneado: \(code)")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.bottom, 40)
                }

                // Controles inferiores
                HStack(spacing: 50) {
                    Button(action: {
                        print("Galería presionada")
                    }) {
                        Image(systemName: "photo")
                            .font(.system(size: 25))
                            .foregroundStyle(.white)
                            .padding()
                            .background(Circle().stroke(Color.white, lineWidth: 2))
                    }

                    Button(action: {
                        scannedCode = "8931759322959"
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 70, height: 70)
                            Circle()
                                .stroke(AppColors.primary, lineWidth: 3)
                                .frame(width: 80, height: 80)
                        }
                    }

                    Button(action: {
                        print("Flash presionado")
                    }) {
                        Image(systemName: "folder")
                            .font(.system(size: 25))
                            .padding()
                            .foregroundStyle(.white)
                            .background(Circle().stroke(Color.white, lineWidth: 2))
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    BarcodeScannerMockView()
}
