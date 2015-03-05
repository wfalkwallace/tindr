//
//  DraggableImageView.swift
//  tindr
//
//  Created by William Falk-Wallace on 3/4/15.
//  Copyright (c) 2015 Falk-Wallace Software. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private var contentView: UIView!

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    var image: UIImage? {
        get { return profileImageView.image }
        set { profileImageView.image = newValue }
    }
}
