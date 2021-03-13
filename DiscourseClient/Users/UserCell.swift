//
//  UserCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 28/03/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet var imageV: UIImageView!
    @IBOutlet var textL: UILabel!
    
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.viewDelegate = self
            
            textL?.text = viewModel.textLabelText
            imageV?.image = viewModel.userImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageV.layer.cornerRadius = imageV.frame.size.width / 2
        imageV.clipsToBounds = true

        
    }
}

extension UserCell: UserCellViewModelViewDelegate {
    func userImageFetched() {
        imageV?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
