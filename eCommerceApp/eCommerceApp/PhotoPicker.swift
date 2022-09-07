//
//  PhotoPicker.swift
//  eCommerceApp
//
//  Created by Shilpee Gupta on 06/09/22.
//

import SwiftUI
import Foundation

struct PhotoPicker: UIViewControllerRepresentable{
    //to let know the struct photo picker know that we have got an image, we will use a binding var.
    @Binding var avatarImage: UIImage!
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
       return Coordinator(photoPicker: self)
    }
    
    //coordinator pattern to connect the uikit with swiftui.
    //UIImagePickerControllerDelegate for firing off the screen after pciking a elem.
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker){
            self.photoPicker=photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    return
                }
                photoPicker.avatarImage = compressedImage
            }else{
                //return an error show an alert.
                Alert(title: Text("Error picking the image."))
            }
            picker.dismiss(animated: true)
        }
    }
    
}
