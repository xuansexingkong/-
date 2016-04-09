//
//  HomeTopView.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "HomeTopView.h"

@implementation HomeTopView

- (instancetype)initWithFrame:(CGRect)frame topdata:(NSMutableArray *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.linkURL =[NSMutableArray array];
        self.dataCount = data.count;
        self.scrolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-20)];
        self.pageCont = [[UIPageControl alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        self.pageCont.numberOfPages = data.count;
        self.pageCont.backgroundColor = [UIColor redColor];
        
        
        self.scrolView.contentOffset = CGPointMake(frame.size.width, 0);
       
        self.scrolView.showsHorizontalScrollIndicator = NO;
        self.scrolView.showsVerticalScrollIndicator = NO;
        self.scrolView.bounces=NO;

        self.pageCont.pageIndicatorTintColor = [UIColor grayColor];

        self.scrolView.pagingEnabled = YES;
        self.scrolView.contentSize = CGSizeMake((frame.size.width)*(data.count), 260-64);
        
        self.scrolView.tag=100;
        self.pageCont.tag = 101;
        self.pageCont.currentPage = 1;
        self.scrolView.delegate =self;
        for (int i = 0; i<data.count; i++) {
            HomeTopModel *model = data[i];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width*i, 0, frame.size.width, 260)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
            imageView.userInteractionEnabled =YES;
            imageView.tag = 200+i;
            [self.linkURL addObject:model.linkurl];
            self.showTime =model.showtime;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ToptapClick:)];
            
            [imageView addGestureRecognizer:tap];
            [self.scrolView addSubview:imageView];

        }
        [NSTimer scheduledTimerWithTimeInterval:[self.showTime integerValue] target:self selector:@selector(timerClick:) userInfo:self.scrolView repeats:YES];
        [self addSubview:self.pageCont];
        [self addSubview:self.scrolView];
        self.scrolView.contentOffset = CGPointMake(self.bounds.size.width, 0);

        
    }
     return self;
}
-(void)timerClick:(NSTimer*)timer
{
    self.count++;
    //计时器传入一个对象
    UIScrollView *scroll = timer.userInfo;
    if(self.count == self.dataCount)
    {
        self.count = 0;
        //解决图片跳动问题，图片切换到第4张时，立马换到第一张，不带动画
        scroll.contentOffset = CGPointMake(0, 0);
    }
    //循环带动画显示下一张图片
    [scroll setContentOffset:CGPointMake(self.bounds.size.width*self.count, 0) animated:YES];
    UIPageControl *page = (UIPageControl*)[self viewWithTag:101];
    //page页的下标与图片页数差1
    page.currentPage = self.count;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //用滚动视图的x坐标除以整屏宽度，得到页数
    int num = scrollView.contentOffset.x/self.bounds.size.width;

    UIPageControl *page = (UIPageControl*)[self viewWithTag:101];
    //根据滚动视图求出的页数设置到分页控制器中
    page.currentPage = num;
}
//webView
-(void)ToptapClick:(UITapGestureRecognizer*)tap
{
    
    self.webblock(tap,self.linkURL,tap.view.tag);
  //  NSLog(@"%ld",tap.view.tag);
}
@end
