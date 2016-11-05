//
//  UIColor+Addition.h
//  OCNews
//
//  Created by 吕成翘 on 16/10/20.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Addition)

+ (instancetype)colorWithHex:(uint32_t)hex;
+ (instancetype)colorWithrandomColor;
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end
