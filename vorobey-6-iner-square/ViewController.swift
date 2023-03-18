//
//  ViewController.swift
//  vorobey-6-iner-square
//
//  Created by Павел Бубликов on 18.03.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: view)
    private var behavior: UISnapBehavior?
    
    private lazy var square: UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 300, width: 100, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemIndigo
        view.layer.cornerRadius = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(square)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let translation = gestureRecognizer.location(in: view)
        if let prevBehavior = behavior {
            animator.removeBehavior(prevBehavior)
        }
        behavior = UISnapBehavior(item: square, snapTo: translation)
        animator.addBehavior(behavior!)
    }
}

