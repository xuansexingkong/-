//
//  OneCell.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneCell.h"

@implementation OneCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)refrushUI:(OneModel*)model
{
    self.name.text=model.name;
    self.cid =model.cid;
    self.distance.text=model.distance;
    self.koubei.text=model.koubeiNum;
    self.designnum.text=model.designNum;
    self.asknum.text=model.peopleNum;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.headImage] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.headImage.layer.borderColor=[UIColor grayColor].CGColor;
    self.headImage.layer.borderWidth=0.2f;
    self.headImage.layer.cornerRadius=5.0;
    if ([model.baoImage isEqualToString:@"1"]) {
        self.baoimage.image=[UIImage imageNamed:@"baozheng"];
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
