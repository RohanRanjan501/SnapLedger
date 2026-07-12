//
//  ReceiptOCRService.swift
//  SnapLedger
//
//  Created by Rohan Ranjan on 12/07/26.
//

import UIKit
import Vision

enum ReceiptOCRService {
    static func recognizeText(from image: UIImage, completion: @escaping (String) -> Void) {
        guard let cgImage = image.cgImage else {
            completion("")
            return
        }

        let request = VNRecognizeTextRequest { request, error in
            guard error == nil,
                  let observations = request.results as? [VNRecognizedTextObservation] else {
                completion("")
                return
            }

            let recognizedText = observations
                .compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: "\n")

            completion(recognizedText)
        }

        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true

        let handler = VNImageRequestHandler(cgImage: cgImage)
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                completion("")
            }
        }
    }
}
