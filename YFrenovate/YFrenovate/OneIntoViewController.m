//
//  OneIntoViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "OneIntoViewController.h"

@interface OneIntoViewController ()

@end

@implementation OneIntoViewController
-(void)loaddata
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    [man GET:[NSString stringWithFormat:path_thired_company_into,self.cid] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
     //   NSLog(@"%@",dic);
        OneIntoModel *model = [[OneIntoModel alloc]initWithDic:dic[@"content"]];
        [self.data addObject:model];
//        OneIntoTwoModel *Twomodel = [[OneIntoTwoModel alloc]initWithDic:dic];
//        [self.data addObject:Twomodel];
        [self.tableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=0;
    self.DefaultData=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CompanyPlist" ofType:@"plist"]];;
    self.data=[NSMutableArray array];
    CGRect rect =  CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height-80);
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
 
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"OneIntoTableViewCell" bundle:nil] forCellReuseIdentifier:@"CompanyCell"];

    [self loaddata];
    

    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden =NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 50;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneIntoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CompanyCell"];
    if (self.data.count!=0) {
       OneIntoModel *model = self.data[0];
        //cell.subtitle.numberOfLines=0;
       // [cell.subtitle sizeToFit];
        cell.subtitle.text = model.data[indexPath.row+indexPath.section*5];
    }
    cell.title.text=self.DefaultData[indexPath.section][indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//////    OneIntoTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"CompanyCell"];
//////    if (indexPath.row%2!=0 &&indexPath.section==1) {
//////        if (self.data.count!=0) {
//////            OneIntoModel *model = self.data[0];
//////            [cell cellAutoLaoutHeight:model.data[indexPath.row+indexPath.section*5]];
//////            CGSize size =[cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
//////            return size.height +1;
//////        }
//////  
//////    }
////
//        return 60;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 50;//section头部高度
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    name.textAlignment=NSTextAlignmentCenter;
    name.font=[UIFont systemFontOfSize:25];
    if (section==0) {
        name.text = @"公司详情";
    }
    else
    {
        name.text = @"公司信息";
    }
    
   
    [view addSubview:name];
    
    return view;
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
