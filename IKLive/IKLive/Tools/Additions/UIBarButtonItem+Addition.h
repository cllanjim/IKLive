//
//  UIBarButtonItem+Addition.h
//  OCNews
//
//  Created by 吕成翘 on 16/10/19.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (Addition)

- (instancetype)initWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
