//
//  DetailPostsVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 4.09.22.
//

import UIKit

class DetailPostsVC: UIViewController {
    

var post: Post?
    
    
    
  

    @IBOutlet weak var titlee: UILabel!
    
    @IBOutlet weak var boddy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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
