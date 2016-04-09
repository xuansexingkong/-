//
//  OneIntoModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneIntoModel : NSObject
@property(nonatomic,copy)NSString *adds;
@property(nonatomic,copy)NSString *cname;
@property(nonatomic,copy)NSString *payfirst;
@property(nonatomic,copy)NSString *koubei;
@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *gsgm;
@property(nonatomic,copy)NSString *shys;
@property(nonatomic,copy)NSString *cqys_qtfs;
@property(nonatomic,copy)NSString *htgfx;
@property(nonatomic,copy)NSString *introduce;

@property(nonatomic,strong)NSMutableArray *data;
//@property(nonatomic,strong)NSMutableArray *bigdata;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
