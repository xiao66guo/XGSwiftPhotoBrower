//
//  PhotoViewController.swift
//  SwiftPhotoBrower
//
//  Created by 小果 on 2017/2/10.
//  Copyright © 2017年 小果. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var currentIndex = 0
    var imageNames: [String] = []
    lazy var iconView : UIImageView = UIImageView()
    
    init(index: Int, imageNames: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.currentIndex = index;
        self.imageNames = imageNames;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
        self.view.addSubview(iconView)
        
        let image = (UIImage(named: imageNames[currentIndex]))!
        var imageSize = image.size
        let screenWidth = UIScreen.main.bounds.size.width
        
        let height = screenWidth * imageSize.height / imageSize.width
        
        imageSize.height = height
        imageSize.width = screenWidth
        iconView.backgroundColor = UIColor.red
        iconView.frame = CGRect(origin: CGPoint.zero, size: imageSize)
        iconView.center = self.view.center
        
        iconView.image = image;

        
    }
    
//    func setupIamgeView() {
//        
//    }

}
