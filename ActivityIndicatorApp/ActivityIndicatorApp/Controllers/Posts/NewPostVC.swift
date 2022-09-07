//
//  NewPostVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 6.09.22.
//


import UIKit
import Alamofire
import SwiftyJSON

class NewPostVC: UIViewController {

    var user: User?
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var bodyTV: UITextView!
    
    
    

    @IBAction func postURLSession() {
        if let userId = user?.id,
           let title = titleTF.text,
           let text = bodyTV.text,
           let url = ApiConstants.postsPathURL
        {
            // SETUP request
            var request = URLRequest(url: url)

            // HEADER
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            // BODY
            let post: [String: Any] = ["userId": userId,
                                       "title": title,
                                       "body": text]

            guard let httpBody = try? JSONSerialization.data(withJSONObject: post, options: []) else { return }
            request.httpBody = httpBody

            // Create dataTask and post new request
            
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                print(response ?? "")
                if let data = data {
                    print(data)
                    let json = JSON(data)
                    print(json)
                    let userId = json["userId"].int
                    let title = json["title"].string
                    let body = json["body"].string
                    
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                } else if let error = error {
                    print(error)
                }
            }.resume()
        }
    }
    
    @IBAction func postAllamofire() {
        if let userId = user?.id,
           let title = titleTF.text,
           let text = bodyTV.text,
           let url = ApiConstants.postsPathURL
        {
            let parameters: Parameters = ["userId": userId,
                                          "title": title,
                                          "body": text]
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in

                    debugPrint(response)
                    print(response.request)
                    print(response.response)
                    debugPrint(response.result)

                    switch response.result {
                    case .success(let data):
                        print(data)
                        print(JSON(data))
                        self.navigationController?.popViewController(animated: true)
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


