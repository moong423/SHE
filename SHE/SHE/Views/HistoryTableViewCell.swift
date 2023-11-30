//
//  HistoryTableViewCell.swift
//  SHE
//
//  Created by Duksu Jang on 2023/11/02.
//

import UIKit
// 히스토리 테이블 셀
class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellContents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
