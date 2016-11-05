//
//  NetworkTool.h
//  09-03-NetEaseNews
//
//  Created by 吕成翘 on 16/9/3.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface NetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;

- (void)GETWithURLString:(NSString *)URLString successBlock:(void(^)(id responseObject))successBlock failBlock:(void(^)(NSError *error))failBlock;

@end
