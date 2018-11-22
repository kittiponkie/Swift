//
//  ViewController.swift
//  Swift09_VideoPlayer
//
//  Created by 6272 on 22/11/2561 BE.
//  Copyright © 2561 6272. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    var movieURL: URL = URL(string: "http://www.ebookfrenzt.com/ios_book/movie/movie.mov")!
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playMethod(_ sender: Any) {
        let player = AVPlayer(url: movieURL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AVPlayerViewController
        destination.player = AVPlayer(url: movieURL)
    }


}

