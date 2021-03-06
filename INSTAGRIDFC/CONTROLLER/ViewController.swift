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

    
    @IBOutlet weak var ButtonFour: UIButton!
    
    @IBOutlet weak var ButtonUp: UIButton!
    
    
    @IBOutlet weak var ButtonBottom: UIButton!
    
    
    
    @IBOutlet weak var PhotoView: PhotoView!
    var ButtonSelect: UIButton!
    //var selection: UIImageAsset! = [Selected]
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    //var translationTransform: CGAffineTransform
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonFour.imageView?.isHidden = false
        ButtonUp.imageView?.isHidden = true
        ButtonBottom.imageView?.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

  
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var photo = UIImage ()
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photo = image
        }
        else if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            photo = image
        }
        
       ButtonSelect.setImage(photo, for: .normal)
        ButtonSelect.imageView?.contentMode = .scaleAspectFill
        dismiss(animated:true, completion: nil)
    }
    
    func Action(Buton: UIButton)  {
        let caméra = UIImagePickerController.isSourceTypeAvailable(.camera)
        let phototèque = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        
        switch (caméra, phototèque) {
        case (true, true):
            let Choice = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
            let actionCamera = UIAlertAction(title: "Caméra", style: .default, handler: { _ in self.Selector(pour: .camera)})
            let actionPhototeque = UIAlertAction(title: "Phototèque", style: .default, handler: { _ in self.Selector(pour: .photoLibrary)})
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
    func Selector(pour typeSource: UIImagePickerController.SourceType) {
        let selector = UIImagePickerController()
        selector.sourceType = typeSource
        selector.delegate = self
        present(selector, animated: true)
        
        
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        ButtonSelect = sender
        Action(Buton : ButtonSelect)
        
    }
    

    
    @IBAction func choose(_ sender: UIButton) {
        switch (sender.tag) {
        case 1:
         PhotoView.changeLayout(topLeftHidden: false, bottomLeftHidden: false)
            hideButtons(button: sender)
        case 2:
            PhotoView.changeLayout(topLeftHidden: true, bottomLeftHidden: false)
            hideButtons(button: sender)
         
        case 3:
            PhotoView.changeLayout(topLeftHidden: false, bottomLeftHidden: true)
            hideButtons(button: sender)
           
        default: print ("Error")
            
    }
    }
    
    func hideButtons(button :UIButton){
        switch button.tag {
        case 1:
            self.ButtonFour.imageView?.isHidden = false
            self.ButtonUp.imageView?.isHidden = true
            self.ButtonBottom.imageView?.isHidden = true
        case 2:
            self.ButtonFour.imageView?.isHidden = true
            self.ButtonUp.imageView?.isHidden = false
            self.ButtonBottom.imageView?.isHidden = true
        case 3:
            self.ButtonFour.imageView?.isHidden = true
            self.ButtonUp.imageView?.isHidden = true
            self.ButtonBottom.imageView?.isHidden = false
        default:
            print ("Error")
        }
    }
    
    
    func barOfActivity () {
        let imageToShare = PhotoView.createImage()
        let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
        
       activityViewController.completionWithItemsHandler = {(nil, completed, _, error) in
         if completed {
            let alertController = UIAlertController(title: "Validation", message: "Vous avez sauvegardé l'image", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.PhotoView.setup()
         } else {
           let alertController = UIAlertController(title: "Annulation", message: "Vous avez annulé l'envoi", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
           alertController.addAction(action)
            
            
        }
        if UIApplication.shared.statusBarOrientation.isLandscape{
            UIView.animate(withDuration: 4, animations: {
                self.PhotoView.transform = CGAffineTransform(translationX: 20, y: 0)
            }, completion: nil)
        }
        if UIApplication.shared.statusBarOrientation.isPortrait{
            UIView.animate(withDuration: 4, animations: {
                self.PhotoView.transform = CGAffineTransform(translationX: 0, y: 10)
            }, completion: nil)
        }    }
    }
    
    @IBAction func Swipe(_ sender: UISwipeGestureRecognizer) {
       
        switch sender.direction {
        case [.left]:
            
            if UIApplication.shared.statusBarOrientation.isLandscape {
            UIView.animate(withDuration: 4, animations: {
               self.PhotoView.transform = CGAffineTransform(translationX: -self.screenWidth + 50, y: 0)
          }, completion: nil)
            barOfActivity()
           
                
            }
        case [.up]:
            if UIApplication.shared.statusBarOrientation.isPortrait {
                UIView.animate(withDuration: 4, animations: {
                self.PhotoView.transform = CGAffineTransform(translationX: 0, y: -self.screenHeight)
            }, completion: nil)
                barOfActivity()
                
                
                
            }
        default:        break
        }
    }
   
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 // UIActivityViewController  UIActivityController
    
}

