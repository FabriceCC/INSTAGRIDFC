//
//  ViewController.swift
//  INSTAGRIDFC
//
//  Created by Fabrice Conchou on 06/01/2019.
//  Copyright © 2019 Fabrice. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var Bouton: UIButton!

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var photo = UIImage ()
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photo = image
        }
        else if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            photo = image
        }
        
       Bouton.setBackgroundImage(photo, for: .normal)
        dismiss(animated:true, completion: nil)
    }
    
    func Action(Buton: UIButton)  {
        let caméra = UIImagePickerController.isSourceTypeAvailable(.camera)
        let phototèque = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        
        switch (caméra, phototèque) {
        case (true, true):
            let Choice = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
            let actionCamera = UIAlertAction(title: "Caméra", style: .default, handler: { _ in self.Selection(pour: .camera)})
            let actionPhototeque = UIAlertAction(title: "Phototèque", style: .default, handler: { _ in self.Selection(pour: .photoLibrary)})
            let actionAnnuler = UIAlertAction(title: "Annuler", style: .cancel)
            Choice.addAction(actionCamera)
            Choice.addAction(actionPhototeque)
            Choice.addAction(actionAnnuler)
            present(Choice, animated: true)
        case (true, false) :
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        case (false, true) :
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        default :
            break
            
            
        }
        
     
    }
    func Selection(pour typeSource: UIImagePickerController.SourceType) {
        let selecteur = UIImagePickerController()
        selecteur.sourceType = typeSource
        selecteur.delegate = self
        present(selecteur, animated: true)
        
        
    }
    @IBOutlet weak var SquareStackView: UIStackView!
    @IBOutlet weak var TopStackView: UIStackView!
    @IBOutlet weak var BottomStackView: UIStackView!
    @IBOutlet weak var TopButtonLeft: UIButton!
    
    @IBAction func ActionButton(_ sender: UIButton) {
        Bouton = sender
        Action(Buton : Bouton)
        
    }
    
    @IBOutlet weak var TopButtonRight: UIButton!
    @IBOutlet weak var BottomButtonLeft: UIButton!
    @IBOutlet weak var BottomButtonRight: UIButton!
   
    
    @IBAction func choose(_ sender: UIButton) {
        switch (sender.tag) {
        case 1:
        TopButtonLeft.isHidden = false
        BottomButtonLeft.isHidden = false
        
        case 2:
            TopButtonLeft.isHidden = true
            BottomButtonLeft.isHidden = false
         
        case 3:
            TopButtonLeft.isHidden = false
            BottomButtonLeft.isHidden = true
           
        default: print ("Error")
            
    }
    }
   
    
    @IBAction func UpSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case [.left]:   print("1")
        case [.up]:     print("3")
        default:        break
        }
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

