//
//  AppDelegate.m
//  HJ_WeChat
//
//  Created by 郭洪军 on 7/5/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "AppDelegate.h"
#import "DSMainController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyWindow];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[DSMainController alloc] init];
    
    
    return YES;
}



@end
