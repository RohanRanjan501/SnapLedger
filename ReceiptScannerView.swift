//
//  ReceiptScannerView.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import SwiftUI
import VisionKit

struct ReceiptScannerView: UIViewControllerRepresentable {
    var onScanComplete: (UIImage) -> Void

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(onScanComplete: onScanComplete)
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let onScanComplete: (UIImage) -> Void

        init(onScanComplete: @escaping (UIImage) -> Void) {
            self.onScanComplete = onScanComplete
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            if scan.pageCount > 0 {
                let image = scan.imageOfPage(at: 0)
                onScanComplete(image)
            }
            controller.dismiss(animated: true)
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true)
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Scan failed: \(error.localizedDescription)")
            controller.dismiss(animated: true)
        }
    }
}
