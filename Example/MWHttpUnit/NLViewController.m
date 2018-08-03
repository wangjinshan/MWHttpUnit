//
//  NLViewController.m
//  MWHttpUnit
//
//  Created by liu nian on 03/22/2016.
//  Copyright (c) 2016 liu nian. All rights reserved.
//

#import "NLViewController.h"
#import "NLHttpHelper.h"

@interface NLViewController ()

@end

@implementation NLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    [[NLHttpHelper sharedSingleton] requestTestData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
