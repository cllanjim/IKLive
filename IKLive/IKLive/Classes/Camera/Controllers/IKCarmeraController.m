//
//  IKCarmeraController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKCarmeraController.h"


@interface IKCarmeraController ()

@end


@implementation IKCarmeraController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
