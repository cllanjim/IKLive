//
//  UIBarButtonItem+Addition.m
//  OCNews
//
//  Created by 吕成翘 on 16/10/19.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "UIBarButtonItem+Addition.h"


@implementation UIBarButtonItem (Addition)

- (instancetype)initWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    if (self = [self init]) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        
        self.customView = button;
    }
    return self;
}

@end
