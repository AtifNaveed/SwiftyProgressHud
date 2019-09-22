//
//  SwiftyProgressHud.swift
//  SwiftyProgressHud
//
//  Created by Atif on 10/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
public class SwiftyProgressHud: UIView {
    private var parentView: UIView!
    private var bgView: UIVisualEffectView!
    private var hudView: UIView!
    private var hudActivity: UIActivityIndicatorView!
    private var lblText: UILabel!
    private var _text: String = "Loading"
    
    public var text: String {
        set { _text = newValue }
        get { return _text  }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
        self.setUpFrame()
        self.setUpProperties()
        self.addSubView()
    }
    
    private func initView() {
        parentView = UIView()
        bgView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        hudView = UIView()
        hudActivity = UIActivityIndicatorView(style: .whiteLarge)
        lblText = UILabel()
    }
    
    private func setUpFrame() {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        bgView.frame = self.frame
        hudView.frame = CGRect(x: 10, y: 10, width: 120, height: 120)
        lblText.frame = CGRect(x: 0, y: 0, width: hudView.frame.width, height: 20.0)
        
        bgView.center = self.center
        hudView.center = self.center
    }
    
    private func setUpProperties() {
        bgView.backgroundColor = .black
        bgView.alpha = 0.3
        
        hudView.layer.cornerRadius = 10.0
        hudView.layer.borderWidth = 1.0
        hudView.layer.borderColor = UIColor.black.cgColor
        hudView.layer.shadowColor = UIColor.black.cgColor
        hudView.clipsToBounds = true
        hudView.backgroundColor = .black
        hudView.alpha = 0.8
        
        hudActivity.translatesAutoresizingMaskIntoConstraints = false
        
        lblText.numberOfLines = 1
        lblText.backgroundColor = .clear
        lblText.textAlignment = .center
        lblText.textColor = .white
        lblText.text = text
        
        bgView.center = self.center
        hudView.center = self.center
    }
    
    private func addSubView() {
        hudView.add(view: hudActivity, left: 0, right: 0, top: -15, bottom: 0)
        hudView.add(view: lblText, left: 1, right: 1, top: 55, bottom: 0)
        self.addSubview(bgView)
        self.addSubview(hudView)
    }
    
    public func show(view: UIView) {
        parentView = view
        lblText.text = text
        parentView.addSubview(self)
        hudActivity.startAnimating()
    }
    
    public func hide() {
        hudActivity.stopAnimating()
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        detectOrientation()
    }
    
    private func detectOrientation() {
        self.setUpFrame()
        if UIDevice.current.orientation.isLandscape {
        } else {
        }
    }
}

extension UIView {
    func add(view: UIView, left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: left).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: right).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: top).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom).isActive = true
    }
}



