//
//  FavoriteButton.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

class FavoriteButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setImage(R.image.favorite_gray_icon(), for: .normal)
        setImage(R.image.favorite_full_icon(), for: .selected)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
