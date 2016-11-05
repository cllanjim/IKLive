//
//  IKShowLiveController.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/6.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKShowLiveController.h"
#import "GPUImageBeautifyFilter.h"


@interface IKShowLiveController ()

@property (strong, nonatomic) GPUImageVideoCamera *videoCamera;
@property (strong, nonatomic) GPUImageView *captureVideoPreview;

@end


@implementation IKShowLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
    GPUImageVideoCamera *videoCamera = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
    videoCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    _videoCamera = videoCamera;
    
    GPUImageView *captureVideoPreview = [[GPUImageView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:captureVideoPreview atIndex:0];
    _captureVideoPreview = captureVideoPreview;
    
    [videoCamera addTarget:captureVideoPreview];
    
    [videoCamera startCameraCapture];
    
    UILabel *label = [UILabel new];
    label.text = @"开启美颜";
    [self.view addSubview:label];
    
    UISwitch *beautySwitch = [UISwitch new];
    beautySwitch.on = NO;
    [self.view addSubview:beautySwitch];
    [beautySwitch addTarget:self action:@selector(beautySwitchAction:) forControlEvents:UIControlEventValueChanged];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"mg_room_btn_guan_h"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.left.equalTo(self.view).offset(10);
    }];
    
    [beautySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(label.mas_right).offset(10);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.right.equalTo(self.view).offset(-10);
    }];
}

- (void)beautySwitchAction:(UISwitch *)sender {
    if (sender.on) {
        [_videoCamera removeAllTargets];
        
        GPUImageBeautifyFilter *beautifyFilter = [[GPUImageBeautifyFilter alloc] init];
        
        [_videoCamera addTarget:beautifyFilter];
        
        [beautifyFilter addTarget:_captureVideoPreview];
        
    } else {
        [_videoCamera removeAllTargets];
        
        [_videoCamera addTarget:_captureVideoPreview];
    }
}

- (void)backButtonAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
