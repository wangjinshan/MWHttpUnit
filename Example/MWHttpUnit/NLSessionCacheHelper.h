//
//  NLSessionCacheHelper.h
//  MWHttpUnit
//
//  Created by liu nian on 7/8/16.
//  Copyright © 2016 liu nian. All rights reserved.
//
//#import <MWHttpUnit/MWHTTPUnit.h>
#import "NLResult.h"

@interface NLSessionCacheHelper : NLHttpSessionCacheUnit
+ (instancetype)sharedClient;
@end
