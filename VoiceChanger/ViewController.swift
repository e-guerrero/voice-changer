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
    var recording: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make record button round
        recordBtn.layer.cornerRadius = recordBtn.layer.bounds.height/2
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        if !recording {
            // Start Recording
            recording = true
            print("Recording...")
            // Prep for stopping
            recordBtn.backgroundColor = UIColor.systemRed
            recordBtn.setTitle("Stop", for: .normal)
        } else {
            // Stop Recording
            recording = false
            print("Recording Stopped.")
            // Prep for recording
            recordBtn.backgroundColor = UIColor.systemGreen
            recordBtn.setTitle("Record", for: .normal)
        }
    }

}

