//
//  ViewController.swift
//  InertialAnimationUIKit
//
//  Created by Сергей Прокопьев on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var roundedView = UIView(frame: .init(x: 0, y: 0, width: 80, height: 80))
    private var snapBehavior: UISnapBehavior!
    private var animator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        let startPoint = CGPoint(x: view.center.x, y: view.center.y)

        animator = UIDynamicAnimator(referenceView: view)

        roundedView.backgroundColor = .cyan
        roundedView.layer.cornerRadius = 8
        roundedView.center = startPoint
        view.addSubview(roundedView)

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)
        if let snap = snapBehavior {
            animator.removeBehavior(snap)
        }
        snapBehavior = UISnapBehavior(item: roundedView, snapTo: tapPoint)
        animator.addBehavior(snapBehavior)
    }
}

