//
//  OneModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *koubeiNum;
@property(nonatomic,copy)NSString *peopleNum;
@property(nonatomic,copy)NSString *designNum;
@property(nonatomic,copy)NSString *headImage;
@property(nonatomic,copy)NSString *baoImage;
@property(nonatomic,copy)NSString *cid;

//@property(nonatomic,copy)NSString *longitude;//经纬度
//@property(nonatomic,copy)NSString *latitude;
- (instancetype)initWithDic:(NSDictionary*)dic;
@end
