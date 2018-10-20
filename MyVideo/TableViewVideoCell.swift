//
//  TableViewVideoCell.swift
//  MyVideo
//
//  Created by kirill on 14.10.2018.
//  Copyright © 2018 kirill. All rights reserved.
//

import UIKit


class TableViewVideoCell : UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView : UIImageView!
    @IBOutlet weak var  username : UILabel!
    
    var video : Video! {
        didSet {
            updateUI()
            //UI Update branch Xcode
        }
    }
    
    func updateUI() {
        
        thumbnailImageView.image = UIImage(named: video.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 5.0
        thumbnailImageView.layer.masksToBounds = true
        username.text = video .authorName
        
    }
    
}

