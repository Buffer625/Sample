//
//  ViewController.swift
//  pageSample
//
//  Created by woong on 2016. 3. 28..
//  Copyright © 2016년 handstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPageViewControllerDataSource {

    var pageViewController : UIPageViewController!
    var pageTitles : NSArray!
    var pageImages : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageTitles = NSArray(objects: "첫번째 페이지" , "두번째 페이지", "세번째 페이지" , "네번째 페이지", "다섯번째 페이지")
        self.pageImages = NSArray(objects: "img01" , "img02" , "img03" , "img04" , "img05")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController] , direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0,30,self.view.frame.width, self.view.frame.height - 100)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        
    }
    
    
    /**
    * viewPageController 구성 함수
    */
    func viewControllerAtIndex (index : Int) -> ContentViewController {
        
        let vc : ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        vc.pageIndex = index
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        
        print(">>> : " ,vc.titleText)
        
        return vc
    }
    
    
    
    /**
    * 이전 ViewPageController 구성
    */
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int

        if( index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        
        return self.viewControllerAtIndex(index)
    }
    
    
    /**
    * 이후 ViewPageController 구성
    */
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        
        var index = vc.pageIndex as Int
        
        if( index == NSNotFound) {
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    
    /**
    * 인디케이터의 총 갯수
    */
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    
    /**
    * 인디케이터의 시작 포지션
    */
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

