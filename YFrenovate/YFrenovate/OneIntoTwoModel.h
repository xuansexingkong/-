//
//  OneIntoTwoModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneIntoTwoModel : NSObject
@property(nonatomic,copy)NSString *gsgm;
@property(nonatomic,copy)NSString *shys;
@property(nonatomic,copy)NSString *cqys_qtfs;
@property(nonatomic,copy)NSString *htgfx;
@property(nonatomic,copy)NSString *introduce;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
