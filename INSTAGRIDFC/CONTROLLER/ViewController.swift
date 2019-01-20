//
//  ViewController.swift
//  INSTAGRIDFC
//
//  Created by utilisateur on 06/01/2019.
//  Copyright © 2019 Fabrice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBOutlet weak var SquareStackView: UIStackView!
    @IBOutlet weak var TopStackView: UIStackView!
    @IBOutlet weak var BottomStackView: UIStackView!
    
    @IBOutlet weak var TopButtonLeft: UIButton!
    @IBAction func TopButtonLeft(_ sender: UIButton) {
    }
    
    @IBOutlet weak var TopButtonRight: UIButton!
    @IBAction func TopButtonRight(_ sender: UIButton) {
    }
    
    @IBOutlet weak var BottomButtonLeft: UIButton!
    @IBAction func BottomButtonLeft(_ sender: UIButton) {
    }
    
    @IBOutlet weak var BottomButtonRight: UIButton!
    @IBAction func BottomButtonRight(_ sender: UIButton) {
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

