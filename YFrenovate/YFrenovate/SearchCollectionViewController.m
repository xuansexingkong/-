//
//  SearchCollectionViewController.m
//  YFrenovate
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SearchCollectionViewController.h"

@interface SearchCollectionViewController ()

@end

@implementation SearchCollectionViewController

//static NSString * const reuseIdentifier = @"Cell";
//html解析
-(void)loadSearchData
{
   
    AFHTTPRequestOperationManager *man = [AFHTTPRequestOperationManager manager];
    man.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:self.strURL] encoding:NSUTF8StringEncoding error:nil];
    NSData *htmlData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    
    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//body/div[1]/div[2]/div[3]/div[2]/div"];
    //NSLog(@"888%ld",elements.count);
    NSArray *arrurl = [xpathParser searchWithXPathQuery:@"//body/div[1]/div[2]/div[3]/div[2]/div/span/a/@href"];
    NSArray *arrTitle = [xpathParser searchWithXPathQuery:@"//body/div[1]/div[2]/div[3]/div[2]/div/span/a/img/@alt"];
    NSArray *arrImage=nil;
  //  NSLog(@"%ld", elements.count);
    for (NSInteger i = 1; i<= 40; i++) {
        if (i>10) {
            arrImage = [xpathParser searchWithXPathQuery:@"//body/div[1]/div[2]/div[3]/div[2]/div/span/a/img/@data-original"];
        }
        else
        {
            arrImage = [xpathParser searchWithXPathQuery:@"//body/div[1]/div[2]/div[3]/div[2]/div/span/a/img/@src"];
        }

        TFHppleElement *elementS = [arrTitle objectAtIndex:i];
        NSString *strTitle = [[elementS content]stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        
        TFHppleElement *elementY = [arrurl objectAtIndex:i];
        NSString *strimageUrl = [[elementY content]stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        
        TFHppleElement *elementZ = [arrImage objectAtIndex:i];
        NSString *strHeadImage = [[elementZ content]stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        
        HomeSecModel *model = [[HomeSecModel alloc]init];
        model.title=strTitle;
        model.imageUrl =strHeadImage;
        model.imageWebUrl =[NSString stringWithFormat:@"http://xiaoguotu.to8to.com%@",strimageUrl];;
      //  NSLog(@"88%@",model.imageWebUrl);

        [self.Data addObject:model];
        
    }
    [self.TableView reloadData];
}
//html解析

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Data = [NSMutableArray array];
   
     self.TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.TableView.backgroundColor = [UIColor grayColor];
    //self.TableView.bounces = NO;
    self.TableView.delegate = self;
    self.TableView.dataSource = self;
    self.TableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:self.TableView];
    [self.TableView registerNib:[UINib nibWithNibName:@"SecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"HotDemoCell"];
    [self loadSearchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


  return self.Data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       return 287;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *webcon = [[WebViewController alloc]init];
    HomeSecModel *model = self.Data[indexPath.row];
    webcon.Weburl = model.imageWebUrl;
    // NSLog(@"88%@",model.imageWebUrl);
    //http://xiaoguotu.to8to.com/c10040078.html
    //http://xiaoguotu.to8to.com/p10454878.html

    [self.navigationController pushViewController:webcon animated:YES];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotDemoCell"];
    HomeSecModel *model = self.Data[indexPath.row];
    cell.Title.text = model.title;
    [cell.HeadImage sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"B7133241330"]];
    cell.subTitle.text = @" ";
    cell.webURL=model.imageWebUrl;
   

    // NSLog(@"77%@",model.title);
    // Configure the cell
    
    return cell;

}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
