//
//  SectionHeadView.h
//  YFrenovate
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^openBlock)(BOOL isopen);
@interface SectionHeadView : UIControl
@property(nonatomic,strong)UILabel *headLab;
@property(nonatomic,strong)UILabel *subLab;
@property(nonatomic,strong)UILabel *clickLab;

@property(nonatomic,strong)NSArray *secArr;
@property(nonatomic,assign)NSInteger isOpenNum;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)headData:(NSDictionary*)headData section:(NSInteger)section;

//@property (nonatomic, copy)openBlock openblock;
@end
