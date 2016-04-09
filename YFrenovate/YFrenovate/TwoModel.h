//
//  TwoModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoModel : NSObject
//@property(nonatomic,strong)NSMutableArray *imageWebUrl;

@property(nonatomic,copy)NSString *imageUrl;
@property(nonatomic,copy)NSString *weburl;
@property(nonatomic,copy)NSString *title;
- (void)initWithDic:(NSDictionary*)dic;

@end
