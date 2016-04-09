//
//  NeedFirstViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "NeedFirstViewController.h"

@interface NeedFirstViewController ()

@end

@implementation NeedFirstViewController
-(void)creatDefailt
{

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"必读"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(presentRightMenuViewController:)];
    

}
-(void)creatdata
{
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    [man GET:path_home_need parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary*obj in dic[@"data"]) {
            NSMutableArray *arr =[NSMutableArray array];
            for (NSDictionary*obj1 in obj[@"value"]) {
                HomeThiredModel *model = [[HomeThiredModel alloc]initWithDic:obj1];
                [arr addObject:model];
            }
            [self.Bigdata addObject:arr];
           //NSLog(@"00%ld",self.data.count);
            
            [self.namedata addObject:obj[@"name"]];
        }
        [self.tableView reloadData];
        if (self.namedata.count!=0) {
            self.title =[NSString stringWithFormat:@"%@阶段",self.namedata[self.NUM]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
   // self.data = [NSMutableArray array];
    self.Bigdata = [NSMutableArray array];
    self.namedata =[NSMutableArray array];
    self.imageArr= @[@"key",@"chuizi",@"chatou",@"chanzi",@"shuazi",@"dianzuan",@"shafa",@"fangzi"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"ThiredTableViewCell" bundle:nil] forCellReuseIdentifier:@"NeedCell"];
    [self.view addSubview:self.tableView];
    
     [self creatdata];
    [self creatDefailt];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   

    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 97;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    
    if (self.Bigdata.count==0) {
        return 0;
    }
    else
    {
        return [self.Bigdata[self.NUM] count];
       
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150.0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150)];
    imageView.image=[UIImage imageNamed:@"bg2"];
    //imageView.backgroundColor=[UIColor grayColor];
    UIImageView *subImageview=[[UIImageView alloc]initWithFrame:CGRectMake(imageView.frame.size.width/2-30, imageView.frame.size.height/2-40, 60, 60)];
    subImageview.image=[UIImage imageNamed:self.imageArr[self.NUM]];
    subImageview.layer.cornerRadius=30.0;
    subImageview.clipsToBounds=YES;
    subImageview.layer.borderColor=[UIColor blackColor].CGColor;
    subImageview.layer.borderWidth=2;
    [imageView addSubview:subImageview];
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(subImageview.frame.origin.x+12, subImageview.frame.origin.y+70, 60, 20)];
    if (self.namedata.count!=0) {
        name.text=self.namedata[self.NUM];
        [imageView addSubview:name];
    }

    return imageView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThiredTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NeedCell"];
    //NSMutableArray *arr = [NSMutableArray arrayWithArray:self.Bigdata[self.NUM]];
    HomeThiredModel *model = self.Bigdata[self.NUM][indexPath.row];
    cell.title.text=model.Title;
    cell.subTitle.text=model.SubTitle;
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:model.HeadImage] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    cell.weburl =model.WebURL;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *webcon = [[WebViewController alloc]init];
  
    HomeThiredModel *model = self.Bigdata[self.NUM][indexPath.row];
      webcon.Weburl = model.WebURL;
    [self.navigationController pushViewController:webcon animated:YES];

    
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
