//
//  LPRTabBarController.m
//  LPR
//
//  Created by 干志雄 on 2018/3/19.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "LPRTabBarController.h"
#import "KBTabbar.h"
#import "MineViewController.h"
#import "OCRViewController.h"
#import "HJTAnimationView.h"

@interface LPRTabBarController ()<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>{
    BOOL _canUserCamera;
}

@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation LPRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    for (UITabBarItem *item in self.tabBar.items) {
        item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // item.title
    }

    [self setCustomtabbar];

    // ------UIImagePickerController
    _canUserCamera = true;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerController.delegate = self;
        self.imagePickerController.allowsEditing = YES;
    } else {
        _canUserCamera = false;
        //         self.takePhotosButton.enabled=NO;
        //        self.selectPhotosButton.enabled=NO;
    }

    return;
    /*OCRViewController *ocrViewController = [OCRViewController new];
    MineViewController *mineViewController = [MineViewController new];

    UINavigationController *oneNavigationController = [[UINavigationController alloc]
    initWithRootViewController:ocrViewController];
    UINavigationController *twoNavigationController = [[UINavigationController alloc]
    initWithRootViewController:mineViewController];

    oneNavigationController.title = @"识别";
    twoNavigationController.title = @"我的";

    oneNavigationController.tabBarItem.image = [[UIImage imageNamed:@"tabbar_home"]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNavigationController.tabBarItem.selectedImage =
        [[UIImage imageNamed:@"tabbar_homeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNavigationController.tabBarItem.image = [[UIImage imageNamed:@"tabbar_me"]
    imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNavigationController.tabBarItem.selectedImage =
        [[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor grayColor] }
    forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithRed:0.271 green:0.514 blue:0.976 alpha:1.000]
    }
                                             forState:UIControlStateSelected];

    self.viewControllers = [NSArray arrayWithObjects:oneNavigationController, twoNavigationController, nil];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - **************** Tabbar
- (void)setCustomtabbar {

    KBTabbar *tabbar = [[KBTabbar alloc] init];

    [self setValue:tabbar forKeyPath:@"tabBar"];

    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)centerBtnClick:(UIButton *)btn {

    NSLog(@"点击了中间");

    HJTAnimationView *animationView = [[HJTAnimationView alloc]initWithTitleArray:nil picarray:@[@"camera",@"photos"]];
    [animationView selectedWithIndex:^(NSInteger index) {
        NSLog(@"HJTAnimationView %ld",(long)index);
        if (index==1) {
            //拍照
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }
        else if (index==2){
            //相册
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }
    }];
    [animationView CLBtnBlock:^(UIButton *btn) {
        NSLog(@"你点了选择/取消按钮");
    }];
    [animationView show];
   
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"点击了中间按钮"
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];

    [alert show];*/
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
