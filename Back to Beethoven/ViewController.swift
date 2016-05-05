//
//  ViewController.swift
//  Back to Beethoven
//
//  Created by Jared Allen on 3/28/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var playbackSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updatePlaybackSlider), userInfo: nil, repeats: true)
        
        let audioFilePath = NSBundle.mainBundle().pathForResource("beethoven-67-1-pfaul", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioFilePath))
            
            playbackSlider.maximumValue = Float(player.duration)
            
        } catch {
            
            // Process error here
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play(sender: AnyObject) {
        
         player.play()
        
    }
   
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        
        let audioFilePath = NSBundle.mainBundle().pathForResource("beethoven-67-1-pfaul", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioFilePath))
            
        } catch {
            
            // Process error here
            
        }
        
    }
    
    @IBAction func adjustPlayback(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(playbackSlider.value)
        
        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
    
        player.volume = volumeSlider.value
        
    }
    
    func updatePlaybackSlider() {
        
        playbackSlider.value = Float(player.currentTime)
        
    }
}

