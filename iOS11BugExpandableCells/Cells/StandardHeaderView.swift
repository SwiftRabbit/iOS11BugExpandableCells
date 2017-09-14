//
//  StandardHeaderView.swift
//  ClientCenterApp
//
//  Created by Leopold Roitel on 17-08-26.
//  Copyright © 2017 Leopold Roitel. All rights reserved.
//

import UIKit

final class StandardHeaderView: UITableViewHeaderFooterView, NibReusable {

    @IBOutlet private weak var switchImageView: UIImageView!
    @IBOutlet private weak var headerTitleLabel: UILabel!
    
    internal static let HEADER_HEIGHT: CGFloat = 70.0
    
    private var selector: (() -> ())!
    
    func configWith(title: String, isOpen: Bool, selector: @escaping () -> ()) {
        
        self.selector = selector
        self.headerTitleLabel.text = title
        
        if isOpen {
            self.switchImageView.image = UIImage(named: "arrow_up")
        } else {
            self.switchImageView.image = UIImage(named: "arrow_down")
        }
        
        self.registerForTapGesture(atTarget: self, withAction: #selector(actionOnUserTapped))
        
        self.contentView.backgroundColor = UIColor.red
    }
    
    @objc private func actionOnUserTapped() {
        self.selector()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headerTitleLabel.text = nil
    }
}
