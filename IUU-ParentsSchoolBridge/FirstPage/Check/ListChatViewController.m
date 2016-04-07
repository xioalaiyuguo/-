//
//  ListChatViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "ListChatViewController.h"
#import "ConversationViewController.h"
#import "Define.h"
#import "MyDate.h"
@interface ListChatViewController ()<RCIMGroupInfoDataSource,RCIMUserInfoDataSource>

@end

@implementation ListChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息";
    self.navigationController.navigationBar.barStyle = 1;
    
    [self BulidView];
    
    [[RCIM sharedRCIM]setUserInfoDataSource:self];
    [[RCIM sharedRCIM]setGroupInfoDataSource:self];
    
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    [self setExtendedLayoutIncludesOpaqueBars:YES];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
    // Dispose of any resources that can be recreated.
}
#pragma mark 创建视图
- (void)BulidView{
    
    
//     空白视图
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(80, 200, 160, 140)];
    
    imageView.image=[UIImage imageNamed:@"提示"];
    
    self.emptyConversationView=imageView;
    
    self.conversationListTableView.tableFooterView=[[UIView alloc]init];
    
//   会话类型
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),@(ConversationType_GROUP)]];
 
}



#pragma mark 群组聊天回传
- (void)getGroupInfoWithGroupId:(NSString *)groupId completion:(void (^)(RCGroup *))completion{
#pragma mark 网络接口，接受数据传进值
    if ([@"666"isEqual:groupId]) {
        RCGroup *group = [[RCGroup alloc]init];
        group.groupId = @"666";
        group.groupName = @"666";
        group.portraitUri = @"666";
        
        return completion(group);
        
    }
    return completion(nil);
}

#pragma mark 个人聊天回传
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
#pragma mark 网络接口，接受数据传进值
    if ([@"1583066886"isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1583066886";
        user.name = @"牛";
        user.portraitUri = @"http://img4q.duitang.com/uploads/item/201411/18/20141118192934_tyUW8.thumb.224_0.jpeg";
        return completion(user);
    }
    return completion(nil);
}
//- (void)rcConversationListTableView:(UITableView *)tableView
//                 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//                  forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    
//}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
    self.isEnteredToCollectionViewController = YES;
    
    ConversationViewController *chat = [[ConversationViewController alloc]init];
    
    chat.conversationType =model.conversationType;
    
    chat.targetId =model.targetId;
    
    chat.title =model.conversationTitle;
    
    [self.navigationController pushViewController:chat animated:YES];
    
    
    
}
- (NSMutableArray *)willReloadTableData:(NSMutableArray *)dataSource{
    
    return dataSource;
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
