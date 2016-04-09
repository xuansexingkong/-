//
//  FirstTableViewCell.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHeader.h"
#import "LibHeader.h"
typedef void(^webBlock)(UITapGestureRecognizer *tap,NSString *webUrl);
@interface FirstTableViewCell : UITableViewCell
@property (nonatomic, copy)webBlock webblock;
@property(nonatomic,strong)NSMutableArray *webURL;

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;


-(void)refrushUI:(HomeFirstModel*)model;
@end
