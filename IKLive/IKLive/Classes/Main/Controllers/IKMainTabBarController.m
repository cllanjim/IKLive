//
//  IKMainTabBarController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKMainTabBarController.h"
#import "IKMainNavigationController.h"
#import "IKShowLiveController.h"


@interface IKMainTabBarController () <UITabBarControllerDelegate>

@property (strong, nonatomic) IKMainNavigationController *carmeraNavigationController;

@end


@implementation IKMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    IKMainNavigationController *liveNavigationController = [self navigationControllerWithClassName:@"IKLiveController" title:@"" imageName:@"tab_live"];
    IKMainNavigationController *carmeraNavigationController = [self navigationControllerWithClassName:@"IKCarmeraController" title:@"" imageName:@"tab_launch"];
    IKMainNavigationController *mineNavigationController = [self navigationControllerWithClassName:@"IKMineController" title:@"" imageName:@"tab_me"];
    
    self.viewControllers = @[liveNavigationController, carmeraNavigationController, mineNavigationController];
    
    _carmeraNavigationController = carmeraNavigationController;
}

/**
 *  根据视图控制器类名创建带导航控制器的视图控制器对象
 *
 *  @param ClassName 视图控制器的类名
 *  @param title     视图控制器的标题
 *  @param imageName 视图控制器的图标名称
 *
 *  @return 带导航控制器的视图控制器对象
 */
- (IKMainNavigationController *)navigationControllerWithClassName:(NSString *)ClassName title:(NSString *)title imageName:(NSString *)imageName{
    Class cls = NSClassFromString(ClassName);
    
    UIViewController *viewController = [[cls alloc] init];
//    viewController.tabBarItem.title = title;
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_p",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    IKMainNavigationController *navigationController = [[IKMainNavigationController alloc] initWithRootViewController:viewController];
    
    return navigationController;
}

/** 获得当前正在显示的控制器 */
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

#pragma mark - Tab bar controller delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (viewController == _carmeraNavigationController) {
        
        IKShowLiveController *viewController = [[IKShowLiveController alloc] init];
        
        [[self getCurrentVC] presentViewController:viewController animated:YES completion:nil];
        return NO;
    }
    return YES;
}

@end
