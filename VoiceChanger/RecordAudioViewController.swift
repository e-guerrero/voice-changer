//
//  RecordAudioViewController.swift
//  VoiceChanger
//
//  Created by Edwin Guerrero on 9/14/20.
//  Copyright © 2020 Edwin Guerrero. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopBtn.isEnabled = false
    }
    
    @IBAction func record(_ sender: Any) {
        print("Record button pressed")
        label.text = "Recording in Progress"
        recordBtn.isEnabled = false
        stopBtn.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath ?? "filePath is nil")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stop(_ sender: Any) {
        print("Stop button pressed")
        label.text = "Tap to Record"
        stopBtn.isEnabled = false
        recordBtn.isEnabled = true
        
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
    }
}

