//
//  NewViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import Foundation
import AVFoundation

class NewViewModel: ObservableObject {
    
    @Published var gameTitle: String = ""
    @Published var boardSizeOptions = [9,13,19]
    @Published var fileStartTime: String = ""
    @Published var fileEndTime: String = ""

    @Published var permissionGranted = false // Flag for permission
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            // Permission has been granted before
            case .authorized:
                permissionGranted = true
                    
            // Permission has not been requested yet
            case .notDetermined:
                requestPermission()
                        
            default:
                permissionGranted = false
        }
    }
    
    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
        }
    }
}
