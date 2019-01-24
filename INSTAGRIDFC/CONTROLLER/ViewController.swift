//
//  ViewController.swift
//  INSTAGRIDFC
//
//  Created by utilisateur on 06/01/2019.
//  Copyright © 2019 Fabrice. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

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
            imagePicker.delegate = self //as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        case (false, true) :
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self //as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
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
        selecteur.delegate = self //as? UIImagePickerControllerDelegate & UINavigationControllerDelegate // as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(selecteur, animated: true)
        
        
    }
    @IBOutlet weak var SquareStackView: UIStackView!
    @IBOutlet weak var TopStackView: UIStackView!
    @IBOutlet weak var BottomStackView: UIStackView!
    
    @IBOutlet weak var TopButtonLeft: UIButton!
    @IBAction func TopButtonLeft(_ sender: UIButton) {
        Bouton = TopButtonLeft
        Action(Buton : Bouton)
        TopButtonLeft = Bouton
    }
    
    @IBOutlet weak var TopButtonRight: UIButton!
    @IBAction func TopButtonRight(_ sender: UIButton) {
        Bouton = TopButtonRight
        Action(Buton : Bouton)
        TopButtonRight = Bouton
    }
    
    @IBOutlet weak var BottomButtonLeft: UIButton!
    @IBAction func BottomButtonLeft(_ sender: UIButton) {
        Bouton = BottomButtonLeft
        Action(Buton : Bouton)
        BottomButtonLeft = Bouton
    }
    
    @IBOutlet weak var BottomButtonRight: UIButton!
    @IBAction func BottomButtonRight(_ sender: UIButton) {
        Bouton = BottomButtonRight
        Action(Buton : Bouton)
        BottomButtonRight = Bouton
    }
    
    @IBAction func Four(_ sender: UIButton) {
        Four()
    }
    
    @IBAction func OneTop(_ sender: UIButton) {
        OneTop()
    }
    
    
    @IBAction func OneBottom(_ sender: UIButton) {
        OneBottom()
    }
    
    private func OneTop() {
        TopButtonLeft.isHidden = true
        TopButtonRight.isHidden = false
        BottomButtonLeft.isHidden = false
        BottomButtonRight.isHidden = false
    }
    
    private func OneBottom() {
        TopButtonLeft.isHidden = false
        TopButtonRight.isHidden = false
        BottomButtonLeft.isHidden = true
        BottomButtonRight.isHidden = false
    }
    
    private func Four() {
        TopButtonLeft.isHidden = false
        TopButtonRight.isHidden = false
        BottomButtonLeft.isHidden = false
        BottomButtonRight.isHidden = false
      
        //Four.setBackgroundImage(Selected, for: .normal)
    
    }
    
    @IBAction func UpSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case [.left]:   TopButtonLeft.isHidden = true
        case [.right]:  TopButtonRight.isHidden = true
        case [.up]:     BottomButtonLeft.isHidden = true
        case [.down]:   BottomButtonRight.isHidden = true
        default:        break
        }
    }
    
    @IBAction func LeftSwipe(_ sender: UISwipeGestureRecognizer) {
    print ("Left")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

