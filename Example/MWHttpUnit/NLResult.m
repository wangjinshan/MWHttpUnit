//
//  NLResult.m
//  MWHttpUnit
//
//  Created by liu nian on 7/8/16.
//  Copyright © 2016 liu nian. All rights reserved.
//

#import "NLResult.h"

@interface NLResult ()
@property (nonatomic, readwrite, strong) NSDictionary *response;
@end
@implementation NLResult
+ (instancetype)resultWithAttributes:(NSDictionary *)attributes{
    return [[NLResult alloc] initWithDict:attributes];
}

+ (instancetype)resultWithCode:(NSInteger)code message:(NSString *)message{
    message                  = message == nil? @"":message;
    NSDictionary *attributes = @{@"errno":@(code),@"errmsg":message};
    
    return [[NLResult alloc] initWithDict:attributes];
}

+ (instancetype)resultWithNSError:(NSError *)error{
    return [NLResult resultWithCode:error.code message:error.localizedDescription];
}

- (id)initWithDict:(NSDictionary *)dict{
    if (self                 = [super init]) {
        self.response = dict;
        if ([[dict allKeys] containsObject:@"errno"]) {
            self.errorCode                = [dict[@"errno"] integerValue];
        }else{
            self.errorCode = 110;
        }
        
        if ([[dict allKeys] containsObject:@"errmsg"]) {
            if (dict[@"errmsg"]) {
                self.message             = dict[@"errmsg"];
            }
        }
    }
    return self;
}

#pragma mark getter
- (BOOL)ableCache{
    return [self success];
}

- (BOOL)success{
    if (self.errorCode == 0) {
        return YES;
    }
    return NO;
}
- (BOOL)noResult{
    if (self.errorCode == 12) {
        return YES;
    }
    return NO;
}

- (NSString *)message{
    if (self.errorCode == -1009) {
        return @"当前服务器无法连接，请稍后再试";
    }
    return _message;
}
@end
