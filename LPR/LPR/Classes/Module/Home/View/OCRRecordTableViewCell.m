//
//  OCRRecordTableViewCell.m
//  LPR
//
//  Created by 干志雄 on 2018/3/29.
//  Copyright © 2018年 干志雄. All rights reserved.
//

#import "OCRRecordTableViewCell.h"

@interface OCRRecordTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *ocrImage;
@property (weak, nonatomic) IBOutlet UIImageView *isCorrectImage;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation OCRRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // ------ocrImage
    self.ocrImage.layer.masksToBounds=YES;
    self.ocrImage.layer.cornerRadius=5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)cellHeight{
    return 299;
}

#pragma mark - **************** 懒加载
-(void)setOcrInfo:(OCRInfo *)ocrInfo{
    if (_ocrInfo!=ocrInfo) {
        _ocrInfo=ocrInfo;
        
        _ocrImage.image=[UIImage imageNamed:ocrInfo.image];
        self.resultLabel.text=ocrInfo.plateNumber;
        if (ocrInfo.isCorrect) {
            self.isCorrectImage.image=[UIImage imageNamed:@"yes.png"];
        }else{
            self.isCorrectImage.image=[UIImage imageNamed:@"no.png"];
        }
        
    }
}

@end
