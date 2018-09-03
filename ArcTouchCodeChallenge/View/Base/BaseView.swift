//
//  BaseView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 20/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import SnapKit

class BaseView: UIView {

    private(set) var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        return spinner
    }()

    public required init() {
        super.init(frame: CGRect.zero)
        configureView()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    internal func configureView() {
        addSubview(spinner)
    }

    override func updateConstraints() {
        super.updateConstraints()

        if spinner.superview != nil {
            spinner.snp.makeConstraints { (maker) in
                maker.center.equalToSuperview()
            }
        }
    }

    func startSpinner() {
        addSubview(spinner)
        spinner.startAnimating()
        spinner.isHidden = false
    }

    func stopSpinner() {
        spinner.removeFromSuperview()
        spinner.startAnimating()
        spinner.isHidden = true
    }
}
