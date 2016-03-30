//
//  ViewController.m
//  viewPager
//
//  Created by woong on 2016. 3. 29..
//  Copyright © 2016년 handstudio. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    //데이터 초기화
    [self initData];
}


/**
 * 데이터 초기화
 */
- (void) initData {

    categotyList = [NSArray arrayWithObjects: @"morning",@"Morning",@"Afternoon", nil];
    
    //PageViewController 초기화
    [self initPageViewController];
}


/**
 * PageViewController 초기화
 */
- (void) initPageViewController {
    
    //pageViewController 생성
    pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:
                          UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageViewController.dataSource = self;
    
    //pageViewController 에 첫번째 화면 초기화
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //pageViewController 사이즈 조정
    pageViewController.view.frame = self.viewPager.bounds;
    
    //pageViewController 화면 viewController 초기화
    [self addChildViewController: pageViewController];
    [self.viewPager addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
}


/**
 * 해당 인덱스 추출
 */
- (NSUInteger)indexOfViewController:(PageViewController *)viewController {
    return [categotyList indexOfObject:viewController.name];
}


/**
 * 해당 인덱스의 화면 반환
 */
- (UIViewController *) viewControllerAtIndex:(NSUInteger)index {
    
    if (([categotyList count] == 0) || (index >= [categotyList count])) {
        return nil;
    }
    
    PageViewController *controller;
    
    if(index == 0) {
        controller = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    } else if (index == 1) {
        controller = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    } else {
        controller = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    }
    
    controller.name = [categotyList objectAtIndex:index];
    
    return controller;
}


/**
 * 이전 페이지 로드
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    
    NSUInteger index = [self indexOfViewController:(PageViewController *)viewController];
    index--;
    
    return [self viewControllerAtIndex:index];
}


/**
 * 다음 페이지 로드
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(PageViewController *)viewController];
    index++;
    
    return [self viewControllerAtIndex:index];
}


@end
