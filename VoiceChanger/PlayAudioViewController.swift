//
//  PlayAudioViewController.swift
//  VoiceChanger
//
//  Created by Edwin Guerrero on 9/18/20.
//  Copyright © 2020 Edwin Guerrero. All rights reserved.
//

import UIKit
import AVFoundation

class PlayAudioViewController: UIViewController {
    
    enum ButtonType: Int { case slow = 0, fast, high, low, echo, reverb }
    
    @IBOutlet weak var slowBtn: UIButton!
    @IBOutlet weak var fastBtn: UIButton!
    @IBOutlet weak var highBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    @IBOutlet weak var echoBtn: UIButton!
    @IBOutlet weak var reverbBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    // MARK: Buttons

    @IBAction func playAudioBtnPressed(_ sender: UIButton) {
        configureUI(.playing)
        switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playAudio(rate: 0.5)
            case .fast:
                playAudio(rate: 1.5)
            case .high:
                playAudio(pitch: 1000)
            case .low:
                playAudio(pitch: -1000)
            case .echo:
                playAudio(echo: true)
            case .reverb:
                playAudio(reverb: true)
        }
    }
    
    @IBAction func stopAudioBtnPressed(_ sender: AnyObject){
        stopAudio()
    }
}
