//
//  BaseViewController.swift
//  ArcTouchCodeChallenge
//
//  Created by Onesight on 20/06/18.
//  Copyright © 2018 Marcelo_Hammes. All rights reserved.
//

import UIKit

class BaseViewController<View: BaseView>: UIViewController {

    internal var contentView: View? {
        if let view = view as? View {
            return view
        } else {
            return nil
        }
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func loadView() {
        view = View()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.string.localizable.navigationTitle()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkText]
        navigationController?.navigationBar.barTintColor = R.color.yellow()
        navigationController?.navigationBar.tintColor = .darkText
    }
}
