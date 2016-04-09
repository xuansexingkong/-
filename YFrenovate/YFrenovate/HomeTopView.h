//
//  HomeTopView.h
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHeader.h"
#import "LibHeader.h"
typedef void(^WebBlock)(UITapGestureRecognizer*tap,NSMutableArray *weburl,NSInteger tag);
@interface HomeTopView : UIView<UIScrollViewDelegate>
@property(nonatomic,copy)NSString *showTime;
@property(nonatomic,strong)NSMutableArray *linkURL;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,strong)UIScrollView *scrolView;
@property(nonatomic,strong)UIPageControl *pageCont;
@property(nonatomic,copy)WebBlock webblock;


@property(nonatomic,assign)NSInteger dataCount;
- (instancetype)initWithFrame:(CGRect)frame topdata:(NSMutableArray *)data;

@end
