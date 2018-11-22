//
//  ViewController.swift
//  Swift08_SoundRecording
//
//  Created by 6272 on 22/11/2561 BE.
//  Copyright © 2561 6272. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func recordMethod(_ sender: Any) {
        print("is Recording = ",audioRecorder!.isRecording)
        if audioRecorder!.isRecording{
            audioRecorder!.stop()
            recordButton.setTitle("Record", for: UIControlState.normal)
            playButton.isEnabled = true
            print("test")
        } else {
            audioRecorder!.record()
            recordButton.setTitle("Stop", for: UIControlState.normal)
            playButton.isEnabled = false
            print("test2")
        }
    }
    @IBAction func playMethod(_ sender: Any) {
        if(!audioRecorder!.isRecording){
            var error: NSError?
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: (audioRecorder!.url))
            }catch let error1 as NSError{
                error = error1
                audioPlayer = nil
            }
            if error != nil{
                print("An error\(String (describing: error)) occured")
            }
            else {
                audioPlayer?.play()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileManager = FileManager()
        let documentFolderUrl = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil ,create: false)
        let fileURL = documentFolderUrl?.appendingPathComponent("Recording.m4a")
        let audioSetting = [AVFormatIDKey : kAudioFormatMPEG4AAC as NSNumber, AVSampleRateKey : 16000.0 as NSNumber, AVNumberOfChannelsKey : 1 as NSNumber, AVEncoderAudioQualityKey : AVAudioQuality.low.rawValue as NSNumber]
        do{
            audioRecorder = try AVAudioRecorder(url: fileURL!, settings: audioSetting)
        } catch _{
            audioRecorder = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

