//
//  NetworkTool.m
//  09-03-NetEaseNews
//
//  Created by 吕成翘 on 16/9/3.
//  Copyright © 2016年 Apress. All rights reserved.
//

/*
 http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1
 */

#import "NetworkTool.h"


@implementation NetworkTool

+ (instancetype)sharedNetworkTool {
    static NetworkTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NetworkTool manager];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}

- (void)GETWithURLString:(NSString *)URLString successBlock:(void (^)(id))successBlock failBlock:(void (^)(NSError *))failBlock{
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(error);
        }
    }];
}

@end
