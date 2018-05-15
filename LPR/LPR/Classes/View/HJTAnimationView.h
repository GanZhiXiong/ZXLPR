//
//  HJTAnimationView.h
//  LPR
//
//  Created by 干志雄 on 2018/3/31.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import <UIKit/UIKit.h>

//选择位置
typedef void (^CLBlock)(NSInteger index);
//选择按钮
typedef void(^CLBtnBlock)(UIButton *btn);

@interface HJTAnimationView : UIView

@property (nonatomic,copy) CLBlock block;
@property (nonatomic,copy) CLBtnBlock btnBlock;
/**
 *  初始化动画视图
 *
 *  @param titlearray title数组
 ＊ @param picarray    图标数组
 */

- (id)initWithTitleArray:(NSArray *)titlearray  picarray:(NSArray *)picarray;

//视图展示
- (void)show;

//选中的index
- (void)selectedWithIndex:(CLBlock)block;

//按钮block
- (void)CLBtnBlock:(CLBtnBlock)block;

@end
