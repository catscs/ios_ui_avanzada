//
//  TopicCellViewModel.swift
//  DiscourseClient
//
//  Created by Roberto Garrido on 08/02/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

protocol TopicCellViewModelViewDelegate: class {
    func topicImageFetched()
}


/// ViewModel que representa un topic en la lista
class TopicCellViewModel: CellViewModel {
    weak var viewDelegate: TopicCellViewModelViewDelegate?
    let topic: Topic
    var textLabelText: String?
    var topicImage: UIImage?
    var createAt: String?
    var messages: String?
    var users: String?
    
    init(topic: Topic) {
        self.topic = topic
        textLabelText = topic.title
        messages = "\(topic.posters.count)"
        users = "\(topic.highestPostNumber)"
                
        let inputFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: topic.createdAt) {
            let outputFormat = "MMM d"
            dateFormatter.dateFormat = outputFormat
            let outputStringDate = dateFormatter.string(from: date)
            createAt = outputStringDate
        }
        

        
        
        super.init()
        guard let imageUrl = topic.imageURL else {
            topicImage = UIImage(named: "avatar")
            return
        }
       
        var imageStringURL = "https://mdiscourse.keepcoding.io"
        imageStringURL.append(imageUrl.replacingOccurrences(of: "{size}", with: "100"))
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: imageStringURL), let data = try? Data(contentsOf: url) {
                self?.topicImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.viewDelegate?.topicImageFetched()
                }
            }
        }
    }
}
