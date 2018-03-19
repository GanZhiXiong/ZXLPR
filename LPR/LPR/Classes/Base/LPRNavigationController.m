//
//  LPRNavigationController.m
//  LPR
//
//  Created by 干志雄 on 2018/3/19.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "LPRNavigationController.h"

@interface LPRNavigationController ()

@end

@implementation LPRNavigationController

+(void)initialize{
    UINavigationBar *navigationBar=[UINavigationBar appearanceWhenContainedIn:[LPRNavigationController class], nil];
    
    navigationBar.tintColor=[UIColor whiteColor];
    navigationBar.barTintColor=[UIColor colorWithRed:0.271 green:0.514 blue:0.976 alpha:1.000];
    navigationBar.translucent=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
