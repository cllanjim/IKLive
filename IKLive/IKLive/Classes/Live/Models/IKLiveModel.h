//
//  IKLiveModel.h
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IKLiveModel : NSObject

@property (strong, nonatomic) NSString *city;

@property (strong, nonatomic) NSString *nick;

@property (strong, nonatomic) NSString *portrait;

@property (assign, nonatomic) NSInteger online_users;

@property (strong, nonatomic) NSString *stream_addr;

@end
