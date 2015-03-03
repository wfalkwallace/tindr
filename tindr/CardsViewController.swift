//
//  CardsViewController.swift
//  tindr
//
//  Created by William Falk-Wallace on 3/3/15.
//  Copyright (c) 2015 Falk-Wallace Software. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    @IBOutlet weak var menuBarImage: UIImageView!
    @IBOutlet weak var actionControlImage: UIImageView!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardInitialCenter = cardImage.frame.origin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(self.view)
        var translation = sender.translationInView(self.view)
        var velocity = sender.velocityInView(self.view)
        println(translation)
        println(cardInitialCenter)
        switch sender.state{
        case .Began:
            cardInitialCenter = cardImage.frame.origin
        case .Changed:
            cardImage.frame.origin.x = cardInitialCenter.x + translation.x
            cardImage.frame.origin.y = cardInitialCenter.y + translation.y
        case .Ended, .Cancelled:
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.cardImage.frame.origin = self.cardInitialCenter
            })
        default:
            break
        }
    }
}
