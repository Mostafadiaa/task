//
//  TableViewCell.swift
//  task
//
//  Created by Mostafa Diaa on 1/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    fileprivate let shopx = shopXvC()
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var unlockLabel: UILabel!
    @IBOutlet weak var arrow: UILabel!
    @IBOutlet weak var redeem: UILabel!
    @IBOutlet weak var gift: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var giftBox: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var giftName: UITextView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        points.layer.masksToBounds = true
        points.layer.cornerRadius = 10

    }

    func viewCell(store:store , gift:gifts ) {
        if let image = try? Data(contentsOf: URL(string: store.image)! ){
            self.storeImage.image = UIImage(data: image)
            
        }
        if let backGround = try? Data(contentsOf: URL(string: store.backImage)!){
            self.backGroundImage.image = UIImage(data: backGround)
        }
        self.storeName.text = store.name
        self.points.text = "\(store.points) Points"
        if store.points >= gift.points {
            self.giftBox.isHidden = false
            self.gift.isHidden = false
           // self.redeem.isHidden = false
            self.redeem.text = "Redeem Now:"
            self.giftName.isHidden = true
           // self.progressView.isHidden = true
            self.gift.text = gift.name
            self.arrow.isHidden = false
            self.unlockLabel.isHidden = false
            self.activity.isHidden = true
            self.activity.stopAnimating()


           // self.giftMessageLabel.text = "You have unlocked"
           // self.backGroundImage.s= true
        }else {
            self.activity.isHidden = false
            self.activity.startAnimating()
            self.giftBox.isHidden = true
            self.arrow.isHidden = true
            self.gift.isHidden = true
           // self.redeem.isHidden = true
            self.giftName.isHidden = false
            self.unlockLabel.isHidden = true
           // self.progressView.isHidden = false
            self.giftName.text = gift.name
            self.redeem.text = "Next Gift"
           // self.storeBgImageView.showBorder = false
        }
    }
 
}
