//
//  ViewController.swift
//  SwiftPhotoBrower
//
//  Created by 小果 on 2017/2/10.
//  Copyright © 2017年 小果. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource {

    var imageName: [String] = ["1","2","3","4","5","6","7"]
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1> 创建一个 PageViewController
        /// transitionStyle（UIPageViewControllerTransitionStyle）: 展示的效果是卷轴效果还是滚动效果
        /// navigationOrientation（UIPageViewControllerNavigationOrientation） : 滚动的方向
        /// UIPageViewControllerOptionInterPageSpacingKey  : 水平的间距
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [UIPageViewControllerOptionInterPageSpacingKey : 20])
        
        // 2> 将 pageVC 添加到父控制器中
        self.addChildViewController(pageVC)
        // 3> 将 pageVC 的View 添加到父控制器的View上
        self.view.addSubview(pageVC.view)
        pageVC.didMove(toParentViewController: self)
        
        // 4> 添加子控制器
        let photoVC = PhotoViewController(index: currentIndex, imageNames: imageName)
        pageVC.setViewControllers([photoVC], direction: .forward, animated: true, completion: nil);
        
        // 5> 设置数据源
        pageVC.dataSource = self;
    }

    /**
     返回当前页面的前一个控制器
     
     - parameter pageViewController: 当前的  pageViewController
     - parameter viewController:     当前的子控制器
     
     - returns: 前一个子控制器
     */

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let cindex = (viewController as! PhotoViewController).currentIndex
        if cindex == 0 {
            return nil
        }
        let VC = PhotoViewController(index: cindex - 1, imageNames: imageName)
        return VC

    }
        
    /**
     返回当前页面的后一个控制器
     
     - parameter pageViewController: 当前的  pageViewController
     - parameter viewController:     当前的子控制器
     
     - returns: 后一个子控制器
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let cindex = (viewController as! PhotoViewController).currentIndex
        if cindex > imageName.count - 1 {
            return nil
        }
        let VC = PhotoViewController(index: cindex + 1, imageNames: imageName)
        return VC
    }

}
