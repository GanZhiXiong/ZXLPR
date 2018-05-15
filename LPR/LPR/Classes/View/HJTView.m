//
//  HJTView.m
//  LPR
//
//  Created by 干志雄 on 2018/3/31.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "HJTView.h"

@implementation HJTView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sheetBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 64)];
        self.sheetBtn.clipsToBounds = YES;
        self.sheetBtn.layer.cornerRadius = 25;
//        self.sheetBtn.backgroundColor=[UIColor redColor];
        [self.sheetBtn setCenter:CGPointMake(self.frame.size.width/2, 10)];
        
        self.sheetLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, self.frame.size.width, 20)];
        [self addSubview:self.sheetLab];
        [self.sheetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.sheetLab setTextAlignment:NSTextAlignmentCenter];
        self.sheetLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.sheetBtn];
        
    }
    return self;
}


- (void)btnClick:(UIButton *)btn
{
    self.block(self.sheetBtn.tag);
}

- (void)selectedIndex:(RRBlock)block
{
    self.block = block;
}




@end

