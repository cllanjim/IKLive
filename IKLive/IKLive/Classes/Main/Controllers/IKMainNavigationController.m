//
//  IKMainNavigationController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKMainNavigationController.h"


@interface IKMainNavigationController ()

@end


@implementation IKMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"global_tittle_bg"] forBarMetrics:UIBarMetricsDefault];
}

/**
 *  解决push到子控制器时tabbar不隐藏的问题
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
