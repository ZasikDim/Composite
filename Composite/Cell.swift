//
//  Cell.swift
//  Composite
//
//  Created by Dmitry Zasenko on 20.12.21.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var countLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
