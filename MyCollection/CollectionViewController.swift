//
//  CollectionViewController.swift
//  MyCollection
//
//  Created by Nannapaneni, Vijay on 4/11/17.
//  Copyright © 2017 Crap App. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var collectionImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        collectionImageView.image = selectedImage
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let mycontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let picit = Picit(context: mycontext)
        picit.title = titleTextField.text
        picit.selectedImage = UIImagePNGRepresentation(collectionImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
