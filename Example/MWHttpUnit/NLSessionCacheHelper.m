//
//  NLSessionCacheHelper.m
//  MWHttpUnit
//
//  Created by liu nian on 7/8/16.
//  Copyright © 2016 liu nian. All rights reserved.
//

#import "NLSessionCacheHelper.h"

#ifndef isDictWithCountMoreThan0

#define isDictWithCountMoreThan0(__dict__) \
(__dict__!=nil && \
[__dict__ isKindOfClass:[NSDictionary class] ] && \
__dict__.count>0)

#endif

#ifndef isArrayWithCountMoreThan0

#define isArrayWithCountMoreThan0(__array__) \
(__array__!=nil && \
[__array__ isKindOfClass:[NSArray class] ] && \
__array__.count>0)

#endif

@implementation NLSessionCacheHelper

+ (instancetype)sharedClient {
    static NLSessionCacheHelper *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *host = @"";
        _sharedClient = [[NLSessionCacheHelper alloc] initWithBaseURL:[NSURL URLWithString:host]];
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        [requestSerializer setValue:[NSString stringWithFormat:@"%@", [[NSLocale preferredLanguages] componentsJoinedByString:@", "]]
                 forHTTPHeaderField:@"Accept-Language"];
        [requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
        _sharedClient.requestSerializer = requestSerializer;
        _sharedClient.responseSerializer = responseSerializer;
    });
    
    return _sharedClient;
}

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - override

/*!
 @author liunian, 16-07-08 11:07:27
 
 @brief 根据返回的原始数据进行结果集对象的初始化
 
 @param responseObject 原始数据对象，当请求成功的时候是字典或者数组等，错误的时候该对象是NSError
 
 @return 自定义的结果集
 */
- (NLResultUnit *)resultUnitOperationCallbackWithResponseObject:(id)responseObject{
    if ([responseObject isKindOfClass:[NSError class]]) {
        NSError *error = (NSError*)responseObject;
        return [NLResult resultWithNSError:error];
    }else if ([responseObject isKindOfClass:[NSDictionary class]]){
        NSDictionary *jsonDict = (NSDictionary *)responseObject;
        if (isDictWithCountMoreThan0(jsonDict)) {
            return [NLResult resultWithAttributes:jsonDict];
        }
    }
    return [NLResult resultWithCode:110 message:@"请求错误"];
}

/*!
 @author liunian, 16-07-08 11:07:10
 
 @brief 该方法是提供接口级缓存需要过滤的参数，如果一些参数值一直可变的话，会导致缓存的唯一标示发生改变，这样缓存就没有意义,类似
 经纬度信息等是需要过滤的,@"latitude",@"longitude"
 
 @return 需要过滤的参数数组
 */
- (NSArray *)parametersToBeFiltered{
    return @[];
}


@end
