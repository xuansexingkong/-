//
//  ThirdViewController.m
//  YFrenovate
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
-(void)creatTop
{
    ThiredTopview *Topview =[[ThiredTopview alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,250)];
    Topview.login=^{
    LoginViewController *login = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    };
    self.TableView.tableHeaderView =Topview;
    
    [self.TableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data =[NSMutableArray array];
    self.serviceData=[NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ServicesPlist" ofType:@"plist"]]; 
    self.TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.TableView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:0.7];
    self.TableView.bounces = NO;
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    //self.TableView.separatorStyle = UITableViewCellSelectionStyleGray;
    [self.view addSubview:self.TableView];
    [self.TableView registerNib:[UINib nibWithNibName:@"ServicesTableViewCell" bundle:nil] forCellReuseIdentifier:@"serviceCell"];
    [self creatTop];
    
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 60;//section头部高度
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            oneViewController *one = [[oneViewController alloc]init];
            //[self presentViewController:one animated:YES completion:nil];
            [self.navigationController pushViewController:one animated:YES];
        }

            break;
        case 1:
        {
            WebViewController *webcon = [[WebViewController alloc]init];
            webcon.Weburl = path_thired_FreeDesign;
            [self.navigationController pushViewController:webcon animated:YES];
        }
            break;
        case 2:
        {
            WebViewController *webcon = [[WebViewController alloc]init];
            webcon.Weburl = path_thired_FreeManager;
            [self.navigationController pushViewController:webcon animated:YES];
        }
            break;
        case 3:
        {
            WebViewController *webcon = [[WebViewController alloc]init];
            webcon.Weburl = path_thired_FreeYanFang;
            [self.navigationController pushViewController:webcon animated:YES];
        }
            break;
        default:
            break;
    }
   
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *service = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, self.view.frame.size.width, 60)];
    service.text =@"装修服务";
    service.font =[UIFont systemFontOfSize:17.0];
    [view addSubview:service];
    
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServicesTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"serviceCell"];
    //cell.headImge.userInteractionEnabled = YES;
    cell.title.text = self.serviceData[indexPath.row][@"title"];
    cell.subTitle.text = self.serviceData[indexPath.row][@"subtitle"];
    cell.headimage.image=[UIImage imageNamed:self.serviceData[indexPath.row][@"icon"]];
    cell.headimage.layer.cornerRadius=20.0;
    cell.headimage.clipsToBounds=YES;
    return cell;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
   // [self.view resignFirstResponder];
    
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
