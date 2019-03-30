//
//  UIview+Extension.swift
//  INSTAGRIDFC
//
//  Created by utilisateur on 30/03/2019.
//  Copyright © 2019 Fabrice. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func createImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
