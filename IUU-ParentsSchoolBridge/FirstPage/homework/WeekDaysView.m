//
//  WeekDaysView.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "WeekDaysView.h"
#import "Define.h"
#import "NSString+new.h"
#import "OneHomeworkViewController.h"
@interface WeekDaysView()
@property (strong,nonatomic)UIButton *btn1;
@property (strong,nonatomic)UIButton *btn2;
@property (strong,nonatomic)UIButton *btn3;
@property (strong,nonatomic)UIButton *btn4;
@property (strong,nonatomic)UIButton *btn5;
@property (strong,nonatomic)UIImageView *rowImage;
@property (strong,nonatomic)UIView *bgView;
@property (strong,nonatomic)UIView *bigBgView;
//@property (strong,nonatomic)UILongPressGestureRecognizer *tap;
@end


@implementation WeekDaysView

-(UIView *)initWithFrame:(CGRect)frame andWithWeek:(NSMutableArray *)weekArr{
    if ( self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.bigBgView = [[UIView alloc]init];
        self.bigBgView.backgroundColor = [UIColor blackColor];
        self.bigBgView.alpha = 0.2;
        [self addSubview:_bigBgView];
        
        self.rowImage = [[UIImageView alloc]init];
        self.rowImage.image = [UIImage imageNamed:@"homework_row"];
        self.rowImage.alpha = 1.0;
        [self addSubview:_rowImage];
        
        self.bgView = [[UIView alloc]init];
         self.bgView.alpha = 1.0;
        self.bgView.backgroundColor = COLOR(95, 191, 131, 1);
        [self addSubview:_bgView];
        
        self.btn1 = [[UIButton alloc]init];
         self.btn1.alpha = 1.0;
        self.btn1.tag = 5001;
        [self.btn1 setTitle:weekArr[0] forState:UIControlStateNormal];
        [self.btn1 setBackgroundImage:[UIImage imageNamed:@"homework_weekDayImage"] forState:UIControlStateHighlighted];
        self.btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn1 addTarget:self action:@selector(ppp:) forControlEvents:UIControlEventTouchUpInside ];
        [self.bgView addSubview:_btn1];
        
        self.btn2 = [[UIButton alloc]init];
         self.btn2.alpha = 1.0;
        self.btn2.tag = 5002;
         self.btn2.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn2 setTitle:weekArr[1] forState:UIControlStateNormal];
        [self.btn2 setBackgroundImage:[UIImage imageNamed:@"homework_weekDayImage"] forState:UIControlStateHighlighted];
        [self.btn2 addTarget:self action:@selector(ppp:) forControlEvents:UIControlEventTouchUpInside ];
        [self.bgView addSubview:_btn2];
        
        self.btn3 = [[UIButton alloc]init];
        self.btn3.alpha = 1.0;
        self.btn3.tag = 5003;
         self.btn3.titleLabel.font = [UIFont systemFontOfSize:15];
         [self.btn3 setTitle:weekArr[2] forState:UIControlStateNormal];
        [self.btn3 setBackgroundImage:[UIImage imageNamed:@"homework_weekDayImage"] forState:UIControlStateHighlighted];
        [self.btn3 addTarget:self action:@selector(ppp:) forControlEvents:UIControlEventTouchUpInside ];
        [self.bgView addSubview:_btn3];
        
        self.btn4 = [[UIButton alloc]init];
        self.btn4.alpha = 1.0;
        self.btn4.tag = 5004;
        [self.btn4 setTitle:weekArr[3] forState:UIControlStateNormal];
        [self.btn4 setBackgroundImage:[UIImage imageNamed:@"homework_weekDayImage"] forState:UIControlStateHighlighted];
         self.btn4.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn4 addTarget:self action:@selector(ppp:) forControlEvents:UIControlEventTouchUpInside ];
        [self.bgView addSubview:_btn4];
        
        self.btn5 = [[UIButton alloc]init];
        self.btn5.alpha = 1.0;
        self.btn5.tag = 5005;
         self.btn5.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn5 setTitle:weekArr[4] forState:UIControlStateNormal];
        [self.btn5 setBackgroundImage:[UIImage imageNamed:@"homework_weekDayImage"] forState:UIControlStateHighlighted];
        [self.btn5 addTarget:self action:@selector(ppp:) forControlEvents:UIControlEventTouchUpInside ];
        [self.bgView addSubview:_btn5];

        

    }
    
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.bigBgView.frame = self.bounds;
    self.rowImage.frame = CGRectMake(287.0/320.0*SCREEN_WIDTH,64, 15, 15);
    self.bgView.frame = CGRectMake(190.0/320.0*SCREEN_WIDTH,64+11,120.0/320.0*SCREEN_WIDTH,180.0/568.0*SCREEN_HEIGHT);
    self.btn1.frame = CGRectMake(0, 20.0/568.0*SCREEN_HEIGHT, 120.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);
    self.btn2.frame = CGRectMake(0, 50.0/568.0*SCREEN_HEIGHT, 120.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);
    self.btn3.frame = CGRectMake(0, 80.0/568.0*SCREEN_HEIGHT, 120.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);
    self.btn4.frame = CGRectMake(0, 110.0/568.0*SCREEN_HEIGHT, 120.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);
    self.btn5.frame = CGRectMake(0, 140.0/568.0*SCREEN_HEIGHT, 120.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);

}

-(void)ppp:(UIButton *)sender{
    NSString *today = [NSString getWeek];
    long int t = sender.tag-5001;
    long int i = sender.tag-5001;
    if ([today isEqualToString:@"星期一"]||[today isEqualToString:@"Monday"]){
        if (i != 0) {
            i = i - 3;
        }
    }
    if ([today isEqualToString:@"星期二"]||[today isEqualToString:@"Tuesday"]){
        if (i != 0&&i != 1) {
            i = i + 2;
        }
    }
    if ([today isEqualToString:@"星期三"]||[today isEqualToString:@"Wednesday"]){
        if (i != 0&&i != 1&&i!=2) {
            i = i+2;
        }
    }
    if ([today isEqualToString:@"星期四"]||[today isEqualToString:@"Thursday"]){
        if (i== 4&&i==5) {
            i = i + 2;
        }
    }

    if ([today isEqualToString:@"星期五"]||[today isEqualToString:@"Friday"]){
        if (i==5) {
            i = i + 2;
        }
    }
    
    if ([today isEqualToString:@"星期六"]||[today isEqualToString:@"Saturday"]){
            i = i - 1;
    }
    
    if ([today isEqualToString:@"星期日"]||[today isEqualToString:@"Sunday"]){
                 i = i - 2;
         }

    NSString *str = [NSString stringWithFormat:@"%ld-%ld",i,t];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadTableview" object:str];
   [self setHidden:YES];
    
}

-(void)lll{
    
    
  }

@end
