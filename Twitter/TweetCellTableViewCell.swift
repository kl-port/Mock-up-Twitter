//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Ken Ling on 3/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false

    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorite(true)}, failure: {(error) in print("Favorite did not succedd: \(error)")})
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorite(false)}, failure: {(error) in print("Unfavorite did not succedd\(error)")})
            
        }
    }
    

    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: {(error) in print("Error is retweeting: \(error)")
            
        })
        
    }
    
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else{
            retweetButton.setImage(UIImage(named:"not-retweet"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        }
    
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"like"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"not-like"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
