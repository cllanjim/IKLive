//
//  IKWatchLiveController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKWatchLiveController.h"


@interface IKWatchLiveController ()

@property (strong, nonatomic) IJKFFMoviePlayerController *playerController;

@end


@implementation IKWatchLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [_playerController pause];
    [_playerController stop];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - SetupUI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    IJKFFMoviePlayerController *playerController = [[IJKFFMoviePlayerController alloc] initWithContentURL:_liveURL withOptions:nil];
    playerController.view.frame = self.view.bounds;
    [self.view addSubview:playerController.view];
    [playerController prepareToPlay];
    _playerController = playerController;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"mg_room_btn_guan_h"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [playerController.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(playerController.view).offset(-8);
        make.bottom.equalTo(playerController.view).offset(-8);
    }];
    

}

- (void)backButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
