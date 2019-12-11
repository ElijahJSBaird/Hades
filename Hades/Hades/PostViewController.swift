//
//  PostViewController.swift
//  Hades
//
//  Created by Jeremy Shaw on 12/2/19.
//  Copyright © 2019 Elijah Baird. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var postTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func post(_ sender: Any) {
//        if (!postTextView.text.isEmpty) {
//            .client?.postTweet(postString: postTextView.text, success: {
//                self.dismiss(animated: true, completion: nil)
//            }, failure: { (error) in
//                print("Error posting \(error)")
//                self.dismiss(animated: true, completion: nil)
//            })
//        } else {
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
