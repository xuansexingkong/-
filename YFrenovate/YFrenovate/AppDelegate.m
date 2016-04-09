//
//  AppDelegate.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSArray * ctlArr = @[@"ViewController",@"SecondViewController",@"ThirdViewController"];
    NSArray * titArr = @[@"首页",@"分类",@"我的"];
    NSArray * imgArr = @[@"tabbar_subject",@"tabbar_appfree",@"tabbar_account"];
    NSArray * selImgArr = @[@"tabbar_subject_press",@"tabbar_appfree_press",@"tabbar_account_press"];

    NSMutableArray * ctls = [NSMutableArray array];
    for (int i = 0; i < ctlArr.count; i++) {
        UIViewController * ctl = [[NSClassFromString(ctlArr[i]) alloc] init];
        ctl.title = titArr[i];
        ctl.tabBarItem.image = [[UIImage imageNamed:imgArr
                                 [i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ctl.tabBarItem.selectedImage =[[UIImage imageNamed:selImgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ctl];
        [ctls addObject:nav];
    }
    
    UITabBarController * tabBarCtl = [[UITabBarController alloc] init];
    tabBarCtl.viewControllers = ctls;
    self.window.rootViewController = tabBarCtl;
    
    
    return YES;
}

    
    // Override point for customization after application launch.


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
