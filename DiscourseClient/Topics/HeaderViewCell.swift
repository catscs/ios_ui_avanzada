//
//  HeaderViewCell.swift
//  DiscourseClient
//
//  Created by Félix Luján Albarrán on 13/3/21.
//  Copyright © 2021 Roberto Garrido. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {
    var viewModel: HeaderViewCellModel?
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContent.layer.cornerRadius = 8
        viewContent.clipsToBounds = true
    }
    
}
