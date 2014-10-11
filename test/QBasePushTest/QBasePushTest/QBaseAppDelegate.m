//
//  QBaseAppDelegate.m
//  QBasePushTest
//
//  Created by andy on 10/11/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "QBaseAppDelegate.h"
#import "QBasePush.h"
#import "DefaultPushHandle.h"
#import "CustomPushHandle.h"

@implementation QBaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    
    // 修饰类数组 (填充修饰的所有数组, 按照数组的先后顺序, 修饰pushHandle)
    NSArray *decorations = @[
                             @"DefaultPushHandle",
                             @"CustomPushHandle"
                             ];
    // 修饰类
    PushHandle *pushHandle = [[PushHandle pushHandle] decorateBy:decorations];
    
    // 注册, 处理
    [QBasePush registPushHandle:pushHandle];
    [QBasePush handleLaunchingOptions:launchOptions];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [QBasePush handleUserInfo:userInfo];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [QBasePush uploadAPNsToken:deviceToken complete:^(id result, NSError *err) {
        
    }];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
