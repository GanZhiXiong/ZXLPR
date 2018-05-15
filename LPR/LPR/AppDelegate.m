//
//  AppDelegate.m
//  LPR
//
//  Created by 干志雄 on 2018/3/19.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "AppDelegate.h"
#import "LPRTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    // 导航条的外观设置
    if ([UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) { //检查是否实现了该协议
        [UINavigationBar appearance].tintColor = [UIColor whiteColor]; //改变系统返回按钮的颜色
        [[UINavigationBar appearance] setTitleTextAttributes:@{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
            NSForegroundColorAttributeName: [UIColor whiteColor]
        }]; //改变导航条内容的颜色
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.333 green:0.600 blue:0.984 alpha:1.000]]; // 改变导航条的系统默认颜色
        [[UINavigationBar appearance] setTranslucent:NO];                        //设置导航条状态栏是否透明
    }

//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    LPRTabBarController *lprTabBarController = [LPRTabBarController new];
//    self.window.rootViewController = lprTabBarController;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];

    //    [self setUpNavigationBarAppearance];

    return YES;
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];

    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    backIetm.title = @"返回";
    [navigationBarAppearance backItem].backBarButtonItem = backIetm;

    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];

        textAttributes = @{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
            NSForegroundColorAttributeName: [UIColor whiteColor],
        };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
            UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
            UITextAttributeTextColor: [UIColor whiteColor],
            UITextAttributeTextShadowColor: [UIColor clearColor],
            UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
        };
#endif
    }

    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate
    // graphics rendering callbacks. Games should use this method to pause the
    // game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate
    // timers, and store enough application state information to restore your
    // application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called
    // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state;
    // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
}

@end
