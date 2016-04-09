//
//  SecondTableViewCell.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHeader.h"
#import "LibHeader.h"
typedef void(^secwebBlock)(NSString *webUrl);
@interface SecondTableViewCell : UITableViewCell
@property (nonatomic, copy)secwebBlock webblock;

@property (weak, nonatomic) IBOutlet UIImageView *HeadImage;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property(nonatomic,copy)NSString *webURL;

-(void)refrushUI:(HomeSecModel*)model;
@end
