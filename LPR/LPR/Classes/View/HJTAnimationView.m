//
//  HJTAnimationView.m
//  LPR
//
//  Created by 干志雄 on 2018/3/31.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "HJTAnimationView.h"

#import "HJTAnimationView.h"
#import "HJTView.h"
#define HH 130
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface HJTAnimationView ()
@property (nonatomic, strong) UIView *largeView;
@property (nonatomic) CGFloat count;

@property (nonatomic, strong) UIButton *chooseBtn;

@end

@implementation HJTAnimationView

- (id)initWithTitleArray:(NSArray *)titlearray picarray:(NSArray *)picarray {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:83 / 255.0 blue:83 / 255.0 alpha:0.7];
        self.largeView = [[UIView alloc] init];
        [_largeView setFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 220)];
        //        [_largeView setBackgroundColor:[UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0
        //        alpha:0.1]];
        [_largeView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_largeView];

        __weak typeof(self) selfBlock = self;

        //        _chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
        //        _chooseBtn.center = CGPointMake(SCREENWIDTH/2, 105);
        //
        //        [_chooseBtn setBackgroundImage:[[UIImage imageNamed:@"photos"]
        //        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        //        [_chooseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [_chooseBtn addTarget:self action:@selector(chooseBtnClick:)
        //        forControlEvents:UIControlEventTouchUpInside];
        //        [self.largeView addSubview:_chooseBtn];
        for (int i = 0; i < 2; i++) {
            HJTView *rr = [[HJTView alloc] initWithFrame:CGRectMake(150 + i * 100, 20, 70, 90)];
            rr.tag = 10 + i;
            rr.sheetBtn.tag = i + 1;

            [rr.sheetBtn setBackgroundImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@",picarray[i]]]
                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                   forState:UIControlStateNormal];

            //            [rr.sheetBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",picarray[i]]]
            //            forState:UIControlStateNormal];
            //  [rr.sheetLab setText:[NSString stringWithFormat:@"%@",titlearray[i]]];

            [rr.sheetLab setTextColor:[UIColor whiteColor]];
            [rr selectedIndex:^(NSInteger index) {
                [self dismiss];
                self.block(index);

            }];

            [self.largeView addSubview:rr];
        }
        UITapGestureRecognizer *dismissTap =
            [[UITapGestureRecognizer alloc] initWithTarget:selfBlock action:@selector(dismiss)];
        [selfBlock addGestureRecognizer:dismissTap];
    }
    return self;
}

- (void)selectedWithIndex:(CLBlock)block {
    self.block = block;
}

- (void)CLBtnBlock:(CLBtnBlock)block {
    self.btnBlock = block;
}

- (void)chooseBtnClick:(UIButton *)sender {
    self.btnBlock(sender);
    [self dismiss];
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];

    [UIView animateWithDuration:0.1
        animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            _largeView.transform = CGAffineTransformMakeTranslation(0, -HH);
        }
        completion:^(BOOL finished) {
            for (int i = 0; i < 2; i++) {

                CGPoint location = CGPointMake(SCREENWIDTH / 3 + SCREENWIDTH / 3 * i, 45);

                HJTView *rr = (HJTView *) [self viewWithTag:10 + i];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(i * 0.03 * NSEC_PER_SEC)),
                               dispatch_get_main_queue(), ^{
                                   [UIView animateWithDuration:1.0
                                                         delay:0
                                        usingSpringWithDamping:0.5
                                         initialSpringVelocity:0.8
                                                       options:UIViewAnimationOptionCurveEaseOut
                                                    animations:^{
                                                        rr.center = location; // CGPointMake(160, 284);
                                                    }
                                                    completion:nil];

                               });
            }
        }];
}

- (void)tap:(UITapGestureRecognizer *)tapG {
    [self dismiss];
}

- (void)dismiss {
    [UIView animateWithDuration:0
        animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            _largeView.transform = CGAffineTransformIdentity;
        }
        completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
}
@end
