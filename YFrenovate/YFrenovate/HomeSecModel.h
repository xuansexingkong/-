//
//  HomeSecModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeSecModel : NSObject
@property(nonatomic,copy)NSString *imageWebUrl;

@property(nonatomic,copy)NSString *imageUrl;

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *subtitle;
- (instancetype)initWithDic:(NSDictionary*)dic;
@end
