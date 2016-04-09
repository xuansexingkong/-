//
//  HomeFirstModel.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeFirstModel : NSObject
@property(nonatomic,strong)NSMutableArray *imageWebUrl;

@property(nonatomic,strong)NSMutableArray *imageUrl;

@property(nonatomic,strong)NSMutableArray *title;
- (void)initWithDic:(NSDictionary*)dic;
@end
