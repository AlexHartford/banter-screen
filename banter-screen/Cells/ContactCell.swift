//
//  ContactCell.swift
//  banter-screen
//
//  Created by Top Dev on 10/6/21.
//

import UIKit

protocol ContactCellDelegate {
    func onProfileClicked(contactData: Contact)
    func onCameraClicked(contactData: Contact)
}

class ContactCell: UITableViewCell {

    @IBOutlet weak var imgProfile: RoundImageView!
    @IBOutlet weak var imgCamera: UIImageView!
    @IBOutlet weak var onlineView: RoundBorderView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblTimeline: UILabel!
    
    var isOnline: Bool = false {
        didSet {
            onlineView.isHidden = isOnline
        }
    }
    
    var delegate : ContactCellDelegate?
    var contactData : Contact!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let profileGuesture = UITapGestureRecognizer(target: self, action: #selector(tap_Profile))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(profileGuesture)
        
        let cameraGuesture = UITapGestureRecognizer(target: self, action: #selector(tap_Camera))
        imgCamera.isUserInteractionEnabled = true
        imgCamera.addGestureRecognizer(cameraGuesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        self.lblUserName.text = self.contactData.userName
        self.lblTimeline.text = "5m ago"
    }
    
    @objc func tap_Profile() {
        self.delegate?.onProfileClicked(contactData: self.contactData)
    }
    
    @objc func tap_Camera() {
        self.delegate?.onCameraClicked(contactData: self.contactData)
    }

}
