//
//  Camera.swift
//  CourseChallengeTabBar
//
//  Created by Renato Vieira da Silva on 19/01/24.
//

import UIKit

protocol CameraDelegate: NSObject {
    func didEditPhoto(_ image: UIImage)
}

class Camera: NSObject {
    
    weak var delegate: CameraDelegate?
    
    func openPhotoLibrary(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        controller.present(imagePicker, animated: true)
    }
    
    func openCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        
        controller.present(imagePicker, animated: true)
    }
}

extension Camera: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        guard let photo = info[.editedImage] as? UIImage else { return }
        
        delegate?.didEditPhoto(photo)
    }
}
