//
//  OCRInfo.h
//  LPR
//
//  Created by 干志雄 on 2018/3/29.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCRInfo : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *plateNumber;

@property (nonatomic, assign) BOOL  isCorrect;

@end
