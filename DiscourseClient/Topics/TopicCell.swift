//
//  TopicCell.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// Celda que representa un topic en la lista
class TopicCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var creaateAt: UILabel!
    @IBOutlet weak var users: UILabel!
    @IBOutlet weak var messages: UILabel!
    
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
           
            label?.text = viewModel.textLabelText
            creaateAt.text = viewModel.createAt
            messages.text = viewModel.messages
            users.text = viewModel.users
            img.image = viewModel.topicImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
        
    }
}


extension TopicCell: TopicCellViewModelViewDelegate {
    func topicImageFetched() {
        img.image = viewModel?.topicImage
        setNeedsLayout()
    }
}
