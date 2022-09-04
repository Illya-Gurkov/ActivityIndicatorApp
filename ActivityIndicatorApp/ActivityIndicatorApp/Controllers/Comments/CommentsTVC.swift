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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
