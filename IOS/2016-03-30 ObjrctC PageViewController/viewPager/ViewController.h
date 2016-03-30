//
//  ViewController.h
//  viewPager
//
//  Created by woong on 2016. 3. 29..
//  Copyright © 2016년 handstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource> {
    
    NSArray *categotyList;
    UIPageViewController *pageViewController;
    
    FirstViewController *firstViewController;
    SecondViewController *secondViewController;
    ThirdViewController *thirdViewController;
    
}

@property (strong, nonatomic) IBOutlet UIView *viewPager;

@end

