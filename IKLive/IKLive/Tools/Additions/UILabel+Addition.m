//
//  UILabel+Addition.m
//  OCNews
//
//  Created by 吕成翘 on 16/10/19.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "UILabel+Addition.h"


@implementation UILabel (Addition)

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)fontSize color:(UIColor *)color {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color;
    label.numberOfLines = 0;
    return label;
}

@end
