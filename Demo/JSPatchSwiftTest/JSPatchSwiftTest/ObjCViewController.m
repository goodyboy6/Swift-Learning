//
//  ObjCViewController.m
//  JSPatchSwiftTest
//
//  Created by yixiaoluo on 16/4/20.
//  Copyright © 2016年 yixiaoluo. All rights reserved.
//

#import "ObjCViewController.h"
#import "JSPatchSwiftTest-Swift.h"

@implementation ObjCViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@", [self getNameAsync]);
    
    
    ViewController *vc = [ViewController new];
    [vc getNameAsync];
}

- (NSString *)getNameAsync {
    return @"Origin ObjCViewController";
}

@end
