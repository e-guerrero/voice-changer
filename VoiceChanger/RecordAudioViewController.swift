//
//  RecordAudioViewController.swift
//  VoiceChanger
//
//  Created by Edwin Guerrero on 9/14/20.
//  Copyright © 2020 Edwin Guerrero. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    // MARK: RecordingState
    
    enum RecordingState { case recording, notRecording }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(.notRecording)
    }
    
    // MARK: Recording Functions
    
    @IBAction func record(_ sender: Any) {
        configureUI(.recording)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stop(_ sender: Any) {
        configureUI(.notRecording)
        
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
    }
    
    // MARK: UI Functions
    
    func configureUI(_ recordState: RecordingState) {
        switch(recordState) {
        case .recording:
            // disable recording button during recording
            setRecordButtonsEnabled(false)
            label.text = "Recording in Progress"
        case .notRecording:
            // enable recording button when recording stops
            setRecordButtonsEnabled(true)
            label.text = "Tap to Record"
        }
    }
    
    func setRecordButtonsEnabled(_ enabled: Bool) {
        recordBtn.isEnabled = enabled
        stopBtn.isEnabled = !enabled
    }
    
    // MARK: Perform Segue
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecordingSegue", sender: audioRecorder.url)
        } else {
            print("Recording not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecordingSegue" {
            let playAudioVC = segue.destination as! PlayAudioViewController
            let recordedAudioURL = sender as! URL
            playAudioVC.recordedAudioURL = recordedAudioURL
        }
    }
}

