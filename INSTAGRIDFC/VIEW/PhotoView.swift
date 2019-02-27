//
//  PhotoView.swift
//  INSTAGRIDFC
//
//  Created by Fabrice on 14/02/2019.
//  Copyright © 2019 Fabrice. All rights reserved.
//

import UIKit

class PhotoView: UIView {

    @IBOutlet weak var TopButtonLeft: UIButton!
    @IBOutlet weak var TopButtonRight: UIButton!
    @IBOutlet weak var BottomButtonLeft: UIButton!
    @IBOutlet weak var BottomButtonRight: UIButton!
    
    func changeLayout(topLeftHidden: Bool , bottomLeftHidden: Bool) {
       TopButtonLeft.isHidden = topLeftHidden
       BottomButtonLeft.isHidden = bottomLeftHidden
        
    }
    
    
    

}
