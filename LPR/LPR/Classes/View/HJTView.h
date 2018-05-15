//
//  HJTView.h
//  LPR
//
//  Created by 干志雄 on 2018/3/31.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import <UIKit/UIKit.h>

//为actionsheet上面的小视图
typedef  void (^RRBlock)(NSInteger index);

@interface HJTView : UIView

@property (nonatomic,strong) UIButton *sheetBtn;
@property (nonatomic,strong) UILabel *sheetLab;
@property (nonatomic,copy) RRBlock block;

- (void)selectedIndex:(RRBlock)block;

@end
