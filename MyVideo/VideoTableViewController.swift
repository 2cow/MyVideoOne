//
//  VideoTableViewController.swift
//  MyVideo
//
//  Created by kirill on 14.10.2018.
//  Copyright © 2018 kirill. All rights reserved.
//

import UIKit

class VideoViewControler: UITableViewController {
    
    var videos : [Video] = Video.fetchVideos()
    
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
    }
    
    
}
