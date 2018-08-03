//
//  NLResult.h
//  MWHttpUnit
//
//  Created by liu nian on 7/8/16.
//  Copyright © 2016 liu nian. All rights reserved.
//
#import "MWHTTPUnit.h"
//#import <MWHttpUnit/NLResultUnit.h>

@interface NLResult : NLResultUnit
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, readonly) BOOL  success;
@property (nonatomic, readonly) BOOL  noResult;
@property (nonatomic, readonly, strong) NSDictionary *response;
+ (instancetype)resultWithAttributes:(NSDictionary *)attributes;
+ (instancetype)resultWithNSError:(NSError *)error;
+ (instancetype)resultWithCode:(NSInteger )code message:(NSString *)message;
@end
