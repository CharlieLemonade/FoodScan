//
//  BarcodeScannerMockView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI
import AVFoundation
import AudioToolbox

// MARK: - VIEW PRINCIPAL CON ESCÁNER
struct BarcodeScannerMockView: View {
    @Environment(\.dismiss) var dismiss
    @State private var scannedCode: String? = nil
    @StateObject private var viewModel = FoodViewModel()
    @State private var showFoodView = false
    @State private var isFlashOn = false

    var body: some View {
        NavigationStack {
            ZStack {
                CameraScannerLayer(onCodeScanned: { code in
                    if scannedCode != code {
                        scannedCode = code
                        viewModel.buscarPorCodigo(code)
                    }
                }, isFlashOn: $isFlashOn)

                ScannerCornerOverlay()

                VStack {
                    // Encabezado
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .font(.headline)
                                .padding()
                                .foregroundStyle(.white)
                        }

                        Spacer()

                        Text("Scan Barcode")
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.semibold)

                        Spacer()

                        Button(action: { dismiss() }) {
                            Image(systemName: "bolt.slash")
                                .font(.headline)
                                .padding()
                                .opacity(0) // Invisible botón extra
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, 32)

                    Spacer()

                    if let code = scannedCode {
                        Text("Código escaneado: \(code)")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }

                    if let error = viewModel.errorMessage {
                        Text("❌ \(error)")
                            .foregroundColor(.red)
                            .padding()
                    }

                    // Botones inferiores
                    HStack(spacing: 50) {
                        Button(action: {
                            print("Galería presionada")
                        }) {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                                .padding()
                                .background(Circle().stroke(Color.white, lineWidth: 2))
                        }

                        Button(action: {
                            let code = "8931759322959"
                            scannedCode = code
                            viewModel.buscarPorCodigo(code)
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 70, height: 70)
                                Circle()
                                    .stroke(Color.blue, lineWidth: 3)
                                    .frame(width: 80, height: 80)
                            }
                        }

                        Button(action: {
                            isFlashOn.toggle()
                        }) {
                            Image(systemName: isFlashOn ? "bolt.fill" : "bolt.slash")
                                .font(.system(size: 20))
                                .padding()
                                .foregroundStyle(.white)
                                .background(Circle().stroke(Color.white, lineWidth: 2))
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(isPresented: $showFoodView) {
                FoodView(viewModel: viewModel)
            }
            .onChange(of: viewModel.food) { food in
                if food != nil {
                    showFoodView = true
                }
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
    }
}

// MARK: - CAPA DE CÁMARA
struct CameraScannerLayer: UIViewControllerRepresentable {
    var onCodeScanned: (String) -> Void
    @Binding var isFlashOn: Bool

    func makeUIViewController(context: Context) -> ScannerViewController {
        let vc = ScannerViewController()
        vc.onCodeScanned = onCodeScanned
        context.coordinator.viewController = vc
        return vc
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        uiViewController.setFlashState(isFlashOn)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        var viewController: ScannerViewController?
    }
}

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var onCodeScanned: ((String) -> Void)?
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private var videoCaptureDevice: AVCaptureDevice?

    override func viewDidLoad() {
        super.viewDidLoad()
        captureSession = AVCaptureSession()

        videoCaptureDevice = AVCaptureDevice.default(for: .video)
        guard let device = videoCaptureDevice,
              let videoInput = try? AVCaptureDeviceInput(device: device),
              captureSession.canAddInput(videoInput) else {
            return
        }

        captureSession.addInput(videoInput)

        let metadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(metadataOutput)

        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.ean13, .ean8, .code128]

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first,
           let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
           let code = readableObject.stringValue {
            captureSession.stopRunning()
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            onCodeScanned?(code)
        }
    }

    func setFlashState(_ on: Bool) {
        guard let device = videoCaptureDevice, device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            if on {
                try device.setTorchModeOn(level: 1.0)
            } else {
                device.torchMode = .off
            }
            device.unlockForConfiguration()
        } catch {
            print("⚠️ Error al cambiar el estado del flash: \(error)")
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }
}



