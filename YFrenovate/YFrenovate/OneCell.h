//
//  OneCell.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
@interface OneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *koubei;
@property (weak, nonatomic) IBOutlet UILabel *asknum;
@property (weak, nonatomic) IBOutlet UILabel *designnum;
@property (weak, nonatomic) IBOutlet UIImageView *baoimage;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property(nonatomic,copy)NSString *cid;
-(void)refrushUI:(OneModel*)model;
@end
