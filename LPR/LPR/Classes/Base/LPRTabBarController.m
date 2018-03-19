//
//  LPRTabBarController.m
//  LPR
//
//  Created by 干志雄 on 2018/3/19.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "LPRTabBarController.h"
#import "MineViewController.h"
#import "OCRViewController.h"

@interface LPRTabBarController ()

@end

@implementation LPRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    OCRViewController *ocrViewController = [OCRViewController new];
    MineViewController *mineViewController = [MineViewController new];

    UINavigationController *oneNavigationController = [[UINavigationController alloc] initWithRootViewController:ocrViewController];
    UINavigationController *twoNavigationController = [[UINavigationController alloc] initWithRootViewController:mineViewController];

    oneNavigationController.title = @"识别";
    twoNavigationController.title = @"我的";

    oneNavigationController.tabBarItem.image = [[UIImage imageNamed:@"tabbar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNavigationController.tabBarItem.selectedImage =
        [[UIImage imageNamed:@"tabbar_homeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNavigationController.tabBarItem.image = [[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNavigationController.tabBarItem.selectedImage =
        [[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor grayColor] } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithRed:0.271 green:0.514 blue:0.976 alpha:1.000]
    }
                                             forState:UIControlStateSelected];

    self.viewControllers = [NSArray arrayWithObjects:oneNavigationController, twoNavigationController, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
