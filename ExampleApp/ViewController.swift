//
//  ViewController.swift
//  ExampleApp
//
//  Created by Haider Khan on 7/7/19.
//  Copyright © 2019 LayoutOps. All rights reserved.
//

import UIKit
import LayoutOps

final class View: UIView {
    
    // MARK: - Views
    
    let label: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Hello"
        view.textColor = .white 
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.label)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.lx
            .set(x: 0.0,
                 y: 0.0,
                 width: 200.0,
                 height: 400.0)
            .center()
            .alignBottom()
    }
    
}

class ViewController: UIViewController {
    
    override func loadView() {
        self.view = View(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

