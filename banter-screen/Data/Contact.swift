//
//  Contact.swift
//  banter-screen
//
//  Created by Top Dev on 10/6/21.
//

import Foundation

struct Contact: Codable {
    var userUid: String
    var userName: String
    var createdAt : Double
}

extension Contact {
    init?(json: [String:Any]){
        guard let userUid = json["userUid"] as? String,
              let userName = json["userName"] as? String,
              let createdAt = json["createdAt"] as? Double else{
                  return nil
              }
        self.userUid = userUid
        self.userName = userName
        self.createdAt = createdAt
    }
}

let mockData : [Contact] = [
    Contact(userUid: "c1ad15c1-469b-4942-a194-d35158aa55ac", userName: "Alex Hartford", createdAt: 1633463730),
    Contact(userUid: "c1ad15c1-709b-453c-a194-d35158aa55ac", userName: "Kristin Cassia", createdAt: 1633463730),
    Contact(userUid: "c1ad15c1-409b-4702-a194-d35158aa55ac", userName: "Resh Sherman", createdAt: 1633463730),
    Contact(userUid: "c1ad15c1-329b-69f2-a194-d35158aa55ac", userName: "Ball Master", createdAt: 1633463730),
    Contact(userUid: "c1ad15c1-414b-2932-a194-d35158aa55ac", userName: "Footie God", createdAt: 1633463730),
]
