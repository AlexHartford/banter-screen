//
//  ContactListVC.swift
//  banter-screen
//
//  Created by Top Dev on 10/5/21.
//

import UIKit

class ContactListVC: UIViewController {

    @IBOutlet weak var contactListView: UITableView!
    
    @IBOutlet weak var imgNotify: UIImageView!
    @IBOutlet weak var imgClose: UIImageView!
    @IBOutlet weak var startConversationView: RoundCardView!
    
    var contactList: [Contact] = []
    
    //Refresh Page
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        addGuestures()
        setMockup_Data()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func initUI(){
        self.startConversationView.isUserInteractionEnabled = true
        self.imgNotify.isUserInteractionEnabled = true
        contactListView.delegate = self
        contactListView.dataSource = self
        // Here is the 
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        contactListView.refreshControl = refreshControl
    }
    
    func addGuestures() {
        let newcnv_guesture = UITapGestureRecognizer(target: self, action: #selector(tap_NewConversation))
        self.startConversationView.addGestureRecognizer(newcnv_guesture)
        
        let notify_guesture = UITapGestureRecognizer(target: self, action: #selector(tap_Notify))
        self.imgNotify.addGestureRecognizer(notify_guesture)
    }
    
    @objc func tap_NewConversation() {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.pageTitle = "New Conversation"
        //
//        self.navigationController?.pushViewController(detailVC, animated: true)
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @objc func tap_Notify() {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.pageTitle = "Notification List"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func refresh() {
       // Code to refresh table view
        self.contactList = mockData
        self.contactListView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    //mock Data...
    func setMockup_Data() {
        self.contactList = mockData
        self.contactListView.reloadData()
    }
}

extension ContactListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.contactData = self.contactList[indexPath.row]
        cell.setData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.pageTitle = self.contactList[indexPath.row].userName
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ContactListVC : ContactCellDelegate {
    
    func onProfileClicked(contactData: Contact) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.pageTitle = contactData.userName + "'s Profile"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func onCameraClicked(contactData: Contact) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.pageTitle = contactData.userName + "'s Camera"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
