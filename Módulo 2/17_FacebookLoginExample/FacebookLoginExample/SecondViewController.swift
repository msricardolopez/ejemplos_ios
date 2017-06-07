//
//  SecondViewController.swift
//  FacebookLoginExample
//
//  Created by Ricardo López on 12/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import ObjectMapper
import Alamofire
import AlamofireImage

class SecondViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let _ = AccessToken.current {
            print("Usuario con sesión")
            loadUserIfo()
        }
        else {
            print("Usuario sin sesión")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func singOutButtonPressed(_ sender: Any) {
        let loginManager = LoginManager()
        
        if let _ = AccessToken.current {
            print("Usuario con sesión")
            loginManager.logOut()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOW_APP_LOGIN_SCREEN"), object: nil)
    }
    
    private func loadUserIfo() {
        
        let connection = GraphRequestConnection()
        //connection.add(GraphRequest(graphPath: "/me")) { httpResponse, result in
        let request = GraphRequest(graphPath: "/me",
                                   parameters: ["fields": "id, name, picture.width(200).height(200), friends"])
        connection.add(request) { httpResponse, result in
            switch result {
            case .success(let response):
                print(response)
                if let fbUserProfile = Mapper<FBUserProfile>().map(JSONObject: response.dictionaryValue) {
                    self.nameLabel.text = fbUserProfile.name
                    if let imageURL = URL(string: fbUserProfile.profileUrl) {
                        self.photoImageView.af_setImage(withURL: imageURL)
                    }
                }
            case .failed(let error):
                print("Graph Request Failed: \(error)")
            }
        }
        connection.start()
        
        
        // Con request
        
        /*
         let connection = GraphRequestConnection()
         connection.add(MyProfileRequest()) { response, result in
         switch result {
         case .success(let response):
         // print("Custom Graph Request Succeeded: \(response.fbUserProfile)")
         if let fbUserProfile = response.fbUserProfile {
         self.nameLabel.text = fbUserProfile.name
         if let imageURL = URL(string: fbUserProfile.profileUrl) {
         self.photoImageView.af_setImage(withURL: imageURL)
         }
         }
         case .failed(let error):
         print("Custom Graph Request Failed: \(error)")
         }
         }
         connection.start()
         */
    }

}

struct MyProfileRequest: GraphRequestProtocol {
    
    struct Response: GraphResponseProtocol {
        
        var fbUserProfile: FBUserProfile?
        
        init(rawResponse: Any?) {
            // Decode JSON from rawResponse into other properties here.
            // print("RAW: \(rawResponse)")
            fbUserProfile = Mapper<FBUserProfile>().map(JSONObject: rawResponse)
        }
    }
    
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name, picture.width(200).height(200)"]
    var accessToken = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}

class FBUserProfile: Mappable {
    
    var id: String?
    var name: String?
    var profileUrl: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        profileUrl <- map["picture.data.url"]
    }
}

