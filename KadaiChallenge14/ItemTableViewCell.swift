//
//  ItemTableViewCell.swift
//  KadaiChallenge14
//
//  Created by 澤田世那 on 2022/05/19.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static var identifier: String { String(describing: self)}
    static var nib: UINib { UINib(nibName: identifier, bundle: nil)}

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    func configure(text: String, isCheck: Bool) {
        checkImageView.image = isCheck ? UIImage(named: "check") : nil
        itemLabel.text = text
    }
}
