//
//  QYAppDelegate.m
//  CommonSetting
//
//  Created by insect on 12/16/2021.
//  Copyright (c) 2021 insect. All rights reserved.
//

#import "QYAppDelegate.h"
#import <CommonSetting/QYCommonSetting.h>

@implementation QYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    _window.backgroundColor = [UIColor whiteColor];
    _window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[QYCommonSettingViewController alloc]init]];
    [_window makeKeyAndVisible];
    return YES;
}

@end
