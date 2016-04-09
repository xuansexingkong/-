//
//  ThiredTopview.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "interfaceHeader.h"
#import "ModelHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
typedef void(^loginBlock)();

@interface ThiredTopview : UIView
@property(nonatomic,copy)loginBlock login;
@end
