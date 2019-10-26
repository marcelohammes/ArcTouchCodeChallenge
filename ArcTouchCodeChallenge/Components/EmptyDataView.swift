//
//  EmptyDataView.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 24/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

import SnapKit

class EmptyDataView: BaseView {

    private(set) var emptyImageView: UIImageView = {
        let imageView = UIImageView(image: R.image.search_icon())
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.errorLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func configureView() {
        addSubview(emptyImageView)
        addSubview(emptyLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        emptyImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalTo(emptyImageView.snp.width)
        }

        emptyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emptyImageView.snp.bottomMargin).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(30)
        }
    }
}
