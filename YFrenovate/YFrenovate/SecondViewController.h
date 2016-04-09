//
//  SecondViewController.h
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibHeader.h"
#import "ViewHeader.h"
#import "ControHeader.h"
#import "interfaceHeader.h"
@interface SecondViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,copy)NSArray *headData;
@property(nonatomic,copy)NSArray *homeData;
@property(nonatomic,strong)NSMutableArray *Data;

@property(nonatomic,assign)NSInteger starIndex;
@property(nonatomic,strong)NSMutableArray *searchData;
@end
