//
//  HomeThiredModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceHeader.h"
@interface HomeThiredModel : NSObject
@property(nonatomic,copy)NSString *HeadImage;
@property(nonatomic,copy)NSString *Title;
@property(nonatomic,copy)NSString *SubTitle;
@property(nonatomic,copy)NSString *WebURL;
@property(nonatomic,copy)NSString *kid;
- (instancetype)initWithDic:(NSDictionary*)dic;
@end
