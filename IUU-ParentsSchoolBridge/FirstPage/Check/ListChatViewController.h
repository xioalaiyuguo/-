//
//  ListChatViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import "ResultViewController.h"
@interface ListChatViewController : RCConversationListViewController
@property (assign, nonatomic)id<resultDelegate>delegate;
@end
