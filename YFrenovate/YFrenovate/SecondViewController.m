//
//  SecondViewController.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong)NSMutableArray *array_bool;
@end

@implementation SecondViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.array_bool =[[NSMutableArray alloc]initWithObjects:@"YES",@"YES",@"YES",@"YES",@"YES",nil];
    self.homeData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Seconddata2PList" ofType:@"plist"]];
    
    self.headData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TwoSectionPlist" ofType:@"plist"]];
    self.Data = [NSMutableArray array];
    
    self.searchData = [NSMutableArray array];
    
    //注册header 和 footer
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(5, 15, 10, 15);
    layout.headerReferenceSize = CGSizeMake(375, 70);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.bounces=NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"TwoCollectionViewCell" bundle:nil]   forCellWithReuseIdentifier:@"TwoCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ClassifyCollectionViewCell" bundle:nil]   forCellWithReuseIdentifier:@"ClassCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    //[self loadSearchData];
    // Do any additional setup after loading the view.
}

//自定义section header  和  footer  ----> 必须注册自定义header和footer的类
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    //NSLog(@"65665%ld",indexPath.section);
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headView" forIndexPath:indexPath];
        UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45)];
        control.tag=100+indexPath.section;
        UILabel *headLab = (UILabel *)[view viewWithTag:200];
        UILabel *subLab = (UILabel *)[view viewWithTag:300];
        UILabel *clickLab =(UILabel *)[view viewWithTag:400];
        
        if(clickLab == nil)
        {
            clickLab = [[UILabel alloc] initWithFrame:CGRectMake(350, 25, 20, 30)];
            clickLab.tag = 400;
            clickLab.text = @">";
            [control addSubview:clickLab];
        }
        else
        {
            if ([self.array_bool[indexPath.section] isEqualToString:@"NO"]) {
                clickLab.text = @"v";
            }
            else
            {
                clickLab.text = @">";
            }

            
        }

        if(headLab == nil)
        {
            headLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 30)];
            headLab.tag = 200;
            headLab.text = self.headData[indexPath.section][@"title"];
            [control addSubview:headLab];
        }
        else
        {
            headLab.text = self.headData[indexPath.section][@"title"];
            
        }
   
        if(subLab == nil)
        {
            subLab = [[UILabel alloc] initWithFrame:CGRectMake(11, 45, 340, 20)];
            subLab.textColor = [UIColor grayColor];
            subLab.font=[UIFont boldSystemFontOfSize:12.0];
            subLab.tag = 300;
            subLab.text = self.headData[indexPath.section][@"subtitle"];
            [control addSubview:subLab];
        }
        else
        {
            subLab.text = self.headData[indexPath.section][@"subtitle"];
            
        }
        
        [control addTarget:self action:@selector(controlClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:control];
        
    }
    return view;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 116);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return self.headData.count;
}
//每个 section中返回 多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([_array_bool[section] isEqualToString:@"YES"]) {
        return 0;
    }
    NSArray *arr =self.homeData[section];
    return arr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //forIndexPath  给指定的cell复用  一般给当前的cell. 直接写indexPath
    UICollectionViewCell *cell = nil;
    if (indexPath.section>2) {
        ClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassCell" forIndexPath:indexPath];
        [cell.headimage sd_setImageWithURL:[NSURL URLWithString:self.homeData[indexPath.section][indexPath.item][@"imageurl"]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
        cell.headimage.layer.cornerRadius =40;
        cell.headimage.clipsToBounds=YES;
        cell.title.text = self.homeData[indexPath.section][indexPath.item][@"name"];
        return cell;
    }
    else
    {
        TwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TwoCell" forIndexPath:indexPath];
        [cell.headImage sd_setImageWithURL:[NSURL URLWithString:self.homeData[indexPath.section][indexPath.item][@"imageurl"]] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
        cell.headImage.layer.cornerRadius =40;
        cell.headImage.clipsToBounds=YES;
        cell.title.text = self.homeData[indexPath.section][indexPath.item][@"name"];
        return cell;
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SearchCollectionViewController *searchCon = [[SearchCollectionViewController alloc]init];
    searchCon.strURL = self.homeData[indexPath.section][indexPath.row][@"interface"];//
    
    [self.navigationController pushViewController:searchCon animated:YES];
    
}
-(void)controlClick:(UIControl *)btn
{
    NSInteger num = btn.tag-100;
    if ( [self.array_bool[num] isEqualToString:@"NO"]) {
        [self.array_bool replaceObjectAtIndex:num withObject:@"YES"];
        // btn.selected = YES;
    }
    else
    {
        [self.array_bool replaceObjectAtIndex:num withObject:@"NO"];
        
        // btn.selected=NO;
    }
    [self.collectionView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
