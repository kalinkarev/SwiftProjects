//
//  AddGolfTableViewCell.swift
//  Golf
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddGolfTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabelAddScreen: UILabel!
    @IBOutlet weak var pointsTexField: UITextField!
    
//    var labHoles = UILabel()
//    var txtPoint = UITextField()
//
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        labHoles.translatesAutoresizingMaskIntoConstraints = false
//        txtPoint.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(labHoles)
//        contentView.addSubview(txtPoint)
//
////        txtPoint.keyboardType = UIKeyboardType.numberPad
//
//        let viewDictionary = [
//            "holes" : labHoles,
//            "points" : txtPoint
//        ] as [String : Any]
//
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[holes]-[points]-|", options: [], metrics: nil, views: viewDictionary))
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
