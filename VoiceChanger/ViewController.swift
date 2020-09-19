//
//  ViewController.swift
//  VoiceChanger
//
//  Created by Edwin Guerrero on 9/14/20.
//  Copyright © 2020 Edwin Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopBtn.isEnabled = false
    }
    
    @IBAction func record(_ sender: Any) {
        print("Record button pressed")
        label.text = "Recording in Progress"
        recordBtn.isEnabled = false
        stopBtn.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        print("Stop button pressed")
        label.text = "Tap to Record"
        stopBtn.isEnabled = false
        recordBtn.isEnabled = true
    }
    
}

