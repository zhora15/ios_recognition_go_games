//
//  CameraView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 12.03.2023.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewRepresentable {
    private let session = AVCaptureSession()
    private let previewLayer = AVCaptureVideoPreviewLayer()
    private let photoOutput = AVCapturePhotoOutput()
    
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    let imageCaptureInterval: TimeInterval
        
    let photoCaptureDelegate: PhotoCaptureDelegate
    
    @Binding var shouldStopTimer: Bool
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.screenWidth, height: UIScreen.screenHeight))
        
        guard let device = AVCaptureDevice.default(for: .video) else { return view }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return view }
        
        session.addInput(input)
        session.addOutput(photoOutput)
        sessionQueue.async { [self] in
            self.session.startRunning()
            
            DispatchQueue.main.async {
                previewLayer.session = session
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.frame = view.bounds
                previewLayer.connection?.videoOrientation = .portrait
                view.layer.addSublayer(previewLayer)
            }
            
        }
        
        startImageCaptureTimer()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        previewLayer.frame = uiView.bounds
    }
    
    private func startImageCaptureTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: imageCaptureInterval, repeats: true) { [self] timer in
            if shouldStopTimer {
                timer.invalidate()
            }
            self.capturePhoto()
        }
        
    }
    
    private func capturePhoto() {
        let photoSettings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: photoSettings, delegate: photoCaptureDelegate)
    }
}

class PhotoCaptureDelegate: NSObject, AVCapturePhotoCaptureDelegate {
    private let serverURL: URL
    
    init(serverURL: URL) {
        self.serverURL = serverURL
        super.init()
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard error == nil else {
            print(error?.localizedDescription)
            return
        }
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        let headers = ["Content-Type": "image/jpeg"]
        let request = NSMutableURLRequest(url: serverURL)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = imageData
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                print("Error sending photo to server: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse {
                print("Photo sent to server with status code: \(response.statusCode)")
            }
        }.resume()
    }
}

struct CameraContentView: View {
    
    @State var shouldStopTimer = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Spacer()
            CameraView(imageCaptureInterval: 3, photoCaptureDelegate: PhotoCaptureDelegate(serverURL: URL(string: "https://7208de36-bea6-4ed7-82f2-c2805b6f8352.mock.pstmn.io/image")!), shouldStopTimer: $shouldStopTimer).frame(width: UIScreen.screenWidth/1.5, height: UIScreen.screenHeight/1.5)
            Spacer()
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                shouldStopTimer = true
                self.presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "arrow.left")
            })
    }
}


