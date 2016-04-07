//
//  Define.h
//  自写tabBar
//
//  Created by administrator on 16/2/23.
//  Copyright © 2016年 lyf. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define COLOR(x,y,z,a) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:a]
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define FONT(a) [UIFont systemFontOfSize:a]

#define RONGYUN_KEY @"m7ua80gbu9qcm"

#define TOKEN @"MILtNmx2LpTAabPmLtUPkC6T83qJ5D/JtLpTKAL0l3jp5y2MXMJ8qFrAe0SETs2euklOzM8TR6wli/QoqzPfR+G4MW0USlid"


//考勤页面cell字大小
#define CHECK_FONT [UIFont systemFontOfSize:15]

//考勤请求数据
#define CHECK_URL @"http://localhost:8888/myobject/myshowapp/index.php/home/index/kaoqinget"
#define CHECK_URL1 @"http://localhost:8888/myobject/myshowapp/index.php/home/index/kaoqin1"
#define CHECK_URL2 @"http://localhost:8888/myobject/myshowapp/index.php/home/index/kaoqin2"
//请假请求数据
#define LEAVE_URL @"http://localhost:8888/myobject/myshowapp/index.php/home/index/updata"
//请假记录请求数据
#define LEAVE_HISTORY @"http://localhost:8888/myobject/myshowapp/index.php/home/index/leave"
//通知请求数据
#define MESSAGE_URL @"http://localhost:8888/myobject/myshowapp/index.php/home/index/message"

#endif /* Define_h */
