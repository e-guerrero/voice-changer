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
    
    enum ButtonType: Int { case slow = 0, fast, high, low, echo, reverb }

    @IBAction func playAudioBtnPressed(_ sender: UIButton){
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
        configureUI(.playing)
    }
    
    @IBAction func stopAudioBtnPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
}
