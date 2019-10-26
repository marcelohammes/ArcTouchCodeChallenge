//
//  ErrorDataView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit
import SnapKit

class ErrorDataView: BaseView {

    private(set) var errorImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.error_icon())
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private(set) var errorLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.errorLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func configureView() {
        addSubview(errorImageView)
        addSubview(errorLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        errorImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalTo(errorImageView.snp.width)
        }

        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(errorImageView.snp.bottomMargin).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(30)
        }
    }
}
