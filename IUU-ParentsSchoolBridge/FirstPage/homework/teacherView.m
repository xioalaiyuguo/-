//
//  teacherView.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "teacherView.h"
#import "Define.h"
@interface teacherView()
@property (strong,nonatomic)UIImageView *bgImageView;
@property (strong,nonatomic)UIImageView *teacherImageView;
@property (strong,nonatomic)UIImageView *bgTeacherImageView;
@property (strong,nonatomic)UILabel *nameLab;
@property (strong,nonatomic)UILabel *subLab;
@property (strong,nonatomic)UILabel *lineLab1;
@property (strong,nonatomic)UILabel *lineLab2;
@property (strong,nonatomic)UILabel *personLab;

@end
static CGRect oldframe;
@implementation teacherView

-(UIView *)initWithFrame:(CGRect)frame andWithTeacherImageView:(NSData *)teacherImageView andWithTeacherName:(NSString *)teacherName andWithSubject:(NSString *)subject{
    if (self = [super init]) {
        self.frame = frame;
        self.bgImageView = [[UIImageView alloc]init];
        self.bgImageView.backgroundColor = COLOR(159, 167, 185, 1);
        self.bgImageView.layer.cornerRadius = 3;
        self.bgImageView.layer.masksToBounds = YES;
        [self addSubview:_bgImageView];
        
       self.bgTeacherImageView = [[UIImageView alloc]init];
        self.bgTeacherImageView.layer.cornerRadius = 45;
        self.bgTeacherImageView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_bgTeacherImageView];
        
        self.teacherImageView = [[UIImageView alloc]init];
        self.teacherImageView.layer.cornerRadius = 35;
        self.teacherImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showImage)];
        [self.teacherImageView addGestureRecognizer:tap];
        self.teacherImageView.backgroundColor = [UIColor blueColor];
        if (teacherImageView) {
             self.teacherImageView.image = [UIImage imageWithData:teacherImageView];
        }else{
            self.teacherImageView.image = [UIImage imageNamed:@"homework_person"];
        }
       
        self.teacherImageView.layer.masksToBounds = YES;
        [self addSubview:_teacherImageView];
        

        
        self.lineLab1 = [[UILabel alloc]init];
        self.lineLab1.backgroundColor = [UIColor whiteColor];
        [self.bgImageView addSubview:_lineLab1];
        
        self.lineLab2 = [[UILabel alloc]init];
        self.lineLab2.backgroundColor = [UIColor whiteColor];
        [self.bgImageView addSubview:_lineLab2];
        
        self.nameLab = [[UILabel alloc]init];
        self.nameLab.font = [UIFont systemFontOfSize:15];
        self.nameLab.textColor = COLOR(194, 194, 194, 1);
         NSString *name = [NSString stringWithFormat:@"%@老师",teacherName];
        if (teacherName) {
            
            self.nameLab.text = name;

        }else{
            self.nameLab.text = @"未知老师";
        }
      
        self.nameLab.textAlignment = NSTextAlignmentRight;
               [self.bgImageView addSubview:_nameLab];
        
        self.subLab = [[UILabel alloc]init];
        self.subLab.font = [UIFont systemFontOfSize:15];
        self.subLab.textColor = COLOR(194, 194, 194, 1);
        self.subLab.textAlignment = NSTextAlignmentLeft;
        NSString *sub = [NSString stringWithFormat:@"（%@老师）",subject];
        self.subLab.text = sub;
        [self.bgImageView addSubview:_subLab];
        
        self.personLab = [[UILabel alloc]init];
        self.personLab.font = [UIFont systemFontOfSize:15];
        self.personLab.textColor = [UIColor whiteColor];
        self.personLab.textAlignment = NSTextAlignmentCenter;
        self.personLab.text = @"发布人";
        [self.bgImageView addSubview:_personLab];
        
        
    }
    return  self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bgImageView.frame = CGRectMake(10.0,45, SCREEN_WIDTH-20.0,155.0);
    self.bgTeacherImageView.frame = CGRectMake(SCREEN_WIDTH/2-45,0, 90, 90);
    self.teacherImageView.frame = CGRectMake(SCREEN_WIDTH/2-35,10.0, 70.0, 70.0);
    self.lineLab1.frame = CGRectMake(24.0/320.0*SCREEN_WIDTH, 28, 70.0/320.0*SCREEN_WIDTH, 1);
    self.lineLab2.frame = CGRectMake(204.0/320.0*SCREEN_WIDTH, 28, 70.0/320.0*SCREEN_WIDTH, 1);
    self.personLab.frame = CGRectMake((SCREEN_WIDTH-20.0)/2-30, 64.0, 60, 16.0);
    self.nameLab.frame = CGRectMake((SCREEN_WIDTH-20.0)/2-100.0, 105.0,100.0, 16);
    self.subLab.frame = CGRectMake((SCREEN_WIDTH-20.0)/2,105, 100.0/320.0*SCREEN_WIDTH, 16);
    
}

-(void)showImage{
   
    UIImage *image = self.teacherImageView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[self.teacherImageView convertRect:self.teacherImageView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}

@end
