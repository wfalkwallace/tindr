//
//  CardsViewController.swift
//  tindr
//
//  Created by William Falk-Wallace on 3/3/15.
//  Copyright (c) 2015 Falk-Wallace Software. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var cardInitialCenter: CGPoint!
    var isPresenting: Bool = true
    
    @IBOutlet weak var menuBarImage: UIImageView!
    @IBOutlet weak var actionControlImage: UIImageView!
    @IBOutlet weak var cardView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.image = UIImage(named: "ryan")
        cardInitialCenter = cardView.frame.origin
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapCard(sender: AnyObject) {
        performSegueWithIdentifier("com.falk-wallace.ProfileSegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationController = segue.destinationViewController as! ProfileViewController
        
        destinationController.profileImageToSet = cardView.image
        destinationController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationController.transitioningDelegate = self
    }
    
    @IBAction func didPanCard(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(self.view)
        var translation = sender.translationInView(self.view)
        var velocity = sender.velocityInView(self.view)
        println(translation)
        println(cardInitialCenter)
        switch sender.state{
        case .Began:
            cardInitialCenter = cardView.frame.origin
        case .Changed:
            cardView.frame.origin.x = cardInitialCenter.x + translation.x
            cardView.frame.origin.y = cardInitialCenter.y + translation.y
        case .Ended, .Cancelled:
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                self.cardView.frame.origin = self.cardInitialCenter
            })
        default:
            break
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            let tImage = UIImageView()
            tImage.image = cardView.image
            tImage.frame = cardView.frame

            containerView.addSubview(toViewController.view)
            containerView.addSubview(tImage)
            
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                tImage.frame = CGRectMake(16, 92, 342, 412)
            }) { (finished: Bool) -> Void in
                tImage.removeFromSuperview()
                transitionContext.completeTransition(true)
                
            }
        } else {
            
            let tImage = UIImageView()
            tImage.image = cardView.image
            tImage.frame = CGRectMake(16, 92, 342, 412)
            containerView.addSubview(tImage)

            UIView.animateWithDuration(0.4, animations: { () -> Void in
                tImage.frame = self.cardView.frame
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    tImage.removeFromSuperview()

            }
        }
    }
        
    
}
