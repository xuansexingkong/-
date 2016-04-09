//
//  ThiredTableViewCell.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^needwebBlock)(NSString *webUrl);
@interface ThiredTableViewCell : UITableViewCell
@property (nonatomic, copy)needwebBlock webblock;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backimage;

@property(nonatomic,copy)NSString *weburl;
-(void)refrushUI:(NSDictionary*)dic;
@end
