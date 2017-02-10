# XGSwiftPhotoBrower

实现思路：
1. 需要一个 RootViewController
2. 创建一个 UIPageViewController
3. 将创建的 PageViewController 添加到 RootViewController 中
4. 设置 PageViewController 的子控制器（数组）
5. 实现 UIPageViewControllerDataSource 的方法

```
PageViewController 的相关设置：

override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1> 创建一个 PageViewController
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
、、、

前一张图片的方法：

```
func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let cindex = (viewController as! PhotoViewController).currentIndex
        if cindex == 0 {
            return nil
        }
        let VC = PhotoViewController(index: cindex - 1, imageNames: imageName)
        return VC

    }

```
下一张图片的方法：

```
func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let cindex = (viewController as! PhotoViewController).currentIndex
        if cindex == imageName.count - 1 {
            return nil
        }
        let VC = PhotoViewController(index: cindex + 1, imageNames: imageName)
        return VC
    }

```
