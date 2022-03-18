//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Ken Ling on 3/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextview.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetTextview: UITextView!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextview.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextview.text, success:{ self.dismiss(animated:true, completion: nil)}, failure:{ (error) in print("Error posting tweet\(error)")
                self.dismiss(animated: true, completion: nil)
            
        })
        } else{
            self.dismiss(animated: true, completion: nil)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
