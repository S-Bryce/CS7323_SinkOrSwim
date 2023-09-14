//
//  PopUpModalViewController.swift
//  CS7323_SinkOrSwim
//
//  Created by Jaime Garza on 9/13/23.
//

import UIKit

public protocol PopUpModalDelegate: AnyObject {
    func dismissModal()
}

public final class PopUpModalViewController: UIViewController {
    
    public weak var delegate: PopUpModalDelegate?
    
    private static func create(
        delegate: PopUpModalDelegate
    ) -> PopUpModalViewController {
        let view = PopUpModalViewController(delegate: delegate)
        return view
    }
    
    @discardableResult
    static public func present(
        initialView: UIViewController,
        delegate: PopUpModalDelegate
    ) -> PopUpModalViewController {
        let view = PopUpModalViewController.create(delegate: delegate)
        view.modalPresentationStyle = .overFullScreen
        view.modalTransitionStyle = .coverVertical
        initialView.present(view, animated: true)
        return view
    }
    
    public init(delegate: PopUpModalDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var canvas: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    @objc func selectedNo(_ button: UIButton) {
        self.delegate?.dismissModal()
    }
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press to dismiss me!", for: .normal)
        button.addTarget(self, action: #selector(self.selectedNo(_:)), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(canvas)
        self.canvas.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            self.canvas.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.canvas.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.dismissButton.heightAnchor.constraint(equalToConstant: 60),
            self.dismissButton.widthAnchor.constraint(equalToConstant: 180),
            self.dismissButton.centerXAnchor.constraint(equalTo: self.canvas.centerXAnchor),
            self.dismissButton.centerYAnchor.constraint(equalTo: self.canvas.centerYAnchor),
            self.canvas.heightAnchor.constraint(equalToConstant: self.view.bounds.height * 0.3),
            self.canvas.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.9)
        ])
    }
}
