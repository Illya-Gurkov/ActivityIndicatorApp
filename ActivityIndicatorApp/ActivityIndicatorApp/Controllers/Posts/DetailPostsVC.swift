//
//  DetailPostsVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 4.09.22.
//

import UIKit

class DetailPostsVC: UIViewController {
    var post: Post?
    
    @IBOutlet var titlee: UILabel!
    
    @IBOutlet var boddy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func commentsButton() {
        let storyboard = UIStoryboard(name: "PostsAndComments", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CommentsTVC") as! CommentsTVC
        vc.posts = post
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        titlee.text = post?.title
        boddy.text = post?.body
    }
}
