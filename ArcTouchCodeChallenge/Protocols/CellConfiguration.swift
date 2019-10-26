//
//  CellConfiguration.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 23/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import Foundation

protocol CellConfiguration: class {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
}
