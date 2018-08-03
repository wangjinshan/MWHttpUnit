//
//  NLHttpHelper.h
//  MWHttpUnit
//
//  Created by liu nian on 3/22/16.
//  Copyright © 2016 liu nian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWHTTPUnit.h"

@interface NLHttpHelper : NSObject
@property (nonatomic, strong) NLHttpSessionUnit *httpSessionUnit;
+ (instancetype)sharedSingleton;

- (void)requestTestData;
@end
