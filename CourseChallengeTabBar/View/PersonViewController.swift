//
//  PersonViewController.swift
//  CourseChallengeTabBar
//
//  Created by Renato Vieira da Silva on 12/01/24.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var userDataList: [UserData] = []
    
    private lazy var pickerController = UIImagePickerController()
    private lazy var camera = Camera()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        configImageView()
        configTextField()
        configTableView()
    }
    
    private func configImageView() {
        photoImageView.image = UIImage(systemName: "person.circle.fill")
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.masksToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        photoImageView.tintColor = .black
    }
    
    private func configTextField() {
        nameTextField.placeholder = "Digite seu nome"
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    @IBAction func editPhotoAction(_ sender: Any) {
        showMenuFoto()
    }
    
    @IBAction func addedDataPersonAction(_ sender: Any) {
        addedDataUser()
    }
    
    private func showMenuFoto() {
        Alert(controller: self).chooseImage { option in
            switch option {
            case .camera:
                self.verifyIsSourceTypeAvailable()
            case .library:
                self.verifyIsSourceTypeAvailable()
            case .cancel:
                break
            }
            
            self.present(self.pickerController, animated: true)
        }
    }
    
    private func verifyIsSourceTypeAvailable() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.camera.delegate = self
            self.camera.openCamera(self, self.pickerController)
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.camera.delegate = self
            self.camera.openPhotoLibrary(self, self.pickerController)
        }
    }
    
    private func addedDataUser() {
        if let name = nameTextField.text, let image =  photoImageView.image {
            if name == "" {
                Alert(controller: self).configSimpleAlert("Aviso", "Necessário preenchimento do nome.")
            } else {
                let userData = UserData(name: name, image: image)
                
                userDataList.append(userData)
                tableView.reloadData()
                
                nameTextField.text = ""
                photoImageView.image = UIImage(systemName: "person.circle.fill")
            }
        }
    }
}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(data: userDataList[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension PersonViewController: CameraDelegate {
    func didEditPhoto(_ image: UIImage) {
        photoImageView.image = image
    }
}


