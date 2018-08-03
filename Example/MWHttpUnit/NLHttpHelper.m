//
//  NLHttpHelper.m
//  MWHttpUnit
//
//  Created by liu nian on 3/22/16.
//  Copyright © 2016 liu nian. All rights reserved.
//

#import "NLHttpHelper.h"

static NSString *HOST = @"http://api.zhuishushenqi.com";
static NSString *TESTURL = @"post/by-block";

@interface NLHttpHelper ()

@end
@implementation NLHttpHelper
- (id)init{
    if (self = [super init]) {
    }
    return self;
}

+ (instancetype)sharedSingleton;{
    static NLHttpHelper *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NLHttpHelper alloc] init];
    });
    
    return _sharedClient;
}

- (void)requestTestData{
    NSMutableDictionary *param = @{}.mutableCopy;
    
    param[@"block"] =@"ramble";
    param[@"duration"] = @"all";
    param[@"sort"] =@"updated";
    param[@"start"] =@(0);
    param[@"limit"] =@(20);
    
    [self.httpSessionUnit requestURL:TESTURL HttpMethod:HttpMethodGet parameters:param successCompleteBlock:^(NSURLSessionTask *sessionTask, id responseObject) {
        
    } failureCompleteBlock:^(NSURLSessionTask *sessionTask, NSError *error) {
        
    }];
}


#pragma mark - getter
- (NLHttpSessionUnit *)httpSessionUnit{
    if (!_httpSessionUnit) {
        _httpSessionUnit = [[NLHttpSessionUnit alloc] initWithBaseURL:[NSURL URLWithString:HOST]];
    }
    return _httpSessionUnit;
}
@end
