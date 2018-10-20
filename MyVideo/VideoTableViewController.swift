//
//  VideoTableViewController.swift
//  MyVideo
//
//  Created by kirill on 14.10.2018.
//  Copyright © 2018 kirill. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class VideoViewControler: UITableViewController {
    
    var videos : [Video] = Video.fetchVideos()
    var player = AVPlayer()
    var playController = AVPlayerViewController()
    
    //MARK: - UITableViewDataSource
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return videos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videCell", for: indexPath) as! TableViewVideoCell
        
        let video = videos[indexPath.row]
        
        cell.video = video
        
        return cell
    }
    
    //MARK:  - DatasourceDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at : indexPath)
    }
    
    func playVideo(at indexPath : IndexPath) {
        let selectedVideo = videos[indexPath.row]
        let videoPath = Bundle.main.path(forResource: selectedVideo.videoFileName, ofType: "mp4")
        let videoUrl = URL(fileURLWithPath: videoPath!)
        
        player = AVPlayer(url: videoUrl)
        self.present(playController, animated: true, completion: {
        self.playController.player?.play()
        })
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -400, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.2
        
        UIView.animate(withDuration: 1.0 ) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
        
    }
    
}
