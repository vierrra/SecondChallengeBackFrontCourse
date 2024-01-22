//
//  Alertt.swift
//  CourseChallengeTabBar
//
//  Created by Renato Vieira on 21/01/24.
//

import UIKit

enum TypeImageSelected {
    case camera
    case library
    case cancel
}

class Alert: NSObject {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func chooseImage(completion: @escaping (_ option: TypeImageSelected) -> Void) {
        let menu = UIAlertController(title: "Seleção de fotos", message: "Escolha biblioteca de fotos para selecionar uma foto ou camera para tirar uma foto", preferredStyle: .actionSheet)
        
        menu.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            completion(.camera)
        }))
        
        menu.addAction(UIAlertAction(title: "Biblioteca de fotos", style: .default, handler: { action in
            completion(.library)
        }))
        
        menu.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            completion(.cancel)
        }))
        
        controller.present(menu, animated: true)
    }
    
    func configSimpleAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        controller.present(alert, animated: true)
    }
}
