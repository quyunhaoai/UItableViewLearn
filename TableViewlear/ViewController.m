//
//  ViewController.m
//  TableViewlear
//
//  Created by hao on 17/9/26.
//  Copyright © 2017年 hao. All rights reserved.
//

#import "ViewController.h"
#import "QYHstatuses.h"
#import "QYHcustomTableViewCell.h"
#import "QYHTools.h"
//#import <AFNetworking/AFNetworking.h>
#import "AFNetworking/AFNetworking.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *mydata;
@property (nonatomic,strong) NSMutableArray *mystatuses;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *index;
@end
//    static NSString  *const cellID = @"cellid";
@implementation ViewController
-(NSArray *)mydata{
    if (_mydata == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path =[bundle pathForResource:@"mydata.plist" ofType:nil];
        _mydata = [NSArray arrayWithContentsOfFile:path];
    }
    return _mydata;
}
-(NSMutableArray *)mystatuses
{
    if (_mystatuses == nil) {
        _mystatuses = [NSMutableArray array];
        for (NSDictionary *dict in self.mydata) {
            QYHstatuses *statuses = [QYHstatuses initWithDictionary:dict];
            [_mystatuses addObject:statuses];;
        }
    }
    return _mystatuses;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self-sizeing  
    //设置cell高自动计算的 ， 需要加约束后生效 IOS8（以后）
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //设置估算高度
    self.tableView.estimatedRowHeight = 44;
    [[QYHTools shareQYHTools] testAction];
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QYHcustomTableViewCell class]) bundle:nil]  forCellReuseIdentifier:cellID];
//    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor grayColor];
    [self questDat];
}
-(void)questDat
{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    url = @"http://apiinfoios.ydbimg.com/Default.aspx?type=app&id=159771";
    
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    //    [manger.tasks makeObjectsPerformSelector:@selector(cancel)];
    [manger GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellid";
    QYHcustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[QYHcustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.statuses = self.mystatuses[indexPath.row];
//    cell.layoutMargins = UIEdgeInsetsZero;
    NSLog(@"%p",cell);
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mystatuses.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    if(self.index == indexPath){
//
//        return 120;
//    }
//
//    return 60;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.index = indexPath;
    
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    // 重点是这2句代码实现的功能
//    [tableView beginUpdates];
//    [tableView endUpdates];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.mystatuses removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        self.tableView.editing = NO;
    }];
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.mystatuses removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

    }];
    
    return @[action,action1];
}
@end
