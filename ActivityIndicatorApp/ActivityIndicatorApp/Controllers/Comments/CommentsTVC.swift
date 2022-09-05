//
//  CommentsTVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 4.09.22.
//

import UIKit

class CommentsTVC: UITableViewController {
    var user: User?
    var posts: Post?
    var comment: [Comment] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchPosts()
        
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comment.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comments = comment[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell", for: indexPath)
        cell.textLabel?.text = comments.name
        cell.detailTextLabel?.text = comments.body
        

        return cell
    }
   private func fetchPosts() {
        
        guard let postId = posts?.id else { return }
        let pathUrl = "\(ApiConstants.commentsPath)?postId=\(postId)"

        guard let url = URL(string: pathUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                self.comment = try JSONDecoder().decode([Comment].self, from: data)
                print(self.comment)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coments = comment [indexPath.row]
        let storyboard = UIStoryboard(name: "PostsAndComments", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetaliCommentsVC") as! DetaliCommentsVC
        vc.comment = coments
        navigationController?.pushViewController(vc, animated: true)
    }
    
   
}
