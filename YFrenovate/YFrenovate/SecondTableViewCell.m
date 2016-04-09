//
//  SecondTableViewCell.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)refrushUI:(HomeSecModel*)model
{
    [self.HeadImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    self.HeadImage.userInteractionEnabled =YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SecTapClick)];
    [self.HeadImage addGestureRecognizer:tap];
    self.Title.text = model.title;
   // NSLog(@"%@",self.Title);
    self.subTitle.text = model.subtitle;
    self.webURL = model.imageWebUrl;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)SecTapClick
{
 self.webblock(self.webURL);
}
@end
