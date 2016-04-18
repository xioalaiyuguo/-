//
//  oneHomeworkTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "OneHomeworkTableViewCell.h"
#import "HomeworkModel.h"
#import "Define.h"
@interface OneHomeworkTableViewCell()
@property (strong,nonatomic)UILabel *lab1;
@property (strong,nonatomic)UILabel *lab2;
@property (strong,nonatomic)UILabel *lab3;
@property (strong,nonatomic)UILabel *lab4;
@property (strong,nonatomic)UILabel *lab5;
@property (strong,nonatomic)UIView *bgView;

//@property (strong,nonatomic)UITapGestureRecognizer *tap;
@end

static CGRect oldframe;
@implementation OneHomeworkTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//        self.backgroundColor = [UIColor blueColor];
        self.backgroundColor = COLOR(248, 248, 248, 1);
        self.bgView = [[UIView alloc]init];
        self.bgView.backgroundColor = [UIColor whiteColor];
    
        self.bgView.layer.cornerRadius = 5;
        
        self.lab1 = [[UILabel alloc]init];
        self.lab1.font = [UIFont systemFontOfSize:15];
        self.lab1.backgroundColor = COLOR(223, 223, 223, 1);
//        self.lab1.backgroundColor = [UIColor redColor];
        self.lab1.layer.cornerRadius = 3;
        self.lab1.layer.masksToBounds = YES;
        self.lab1.numberOfLines = 0;
        self.lab1.textAlignment = NSTextAlignmentCenter;
        self.lab1.textColor = [UIColor blackColor];
        [self.bgView addSubview:_lab1];
        
        self.lab2 = [[UILabel alloc]init];
        self.lab2.font = [UIFont systemFontOfSize:15];
        self.lab2.numberOfLines = 0;
//        self.lab2.backgroundColor = [UIColor redColor];
        [self.bgView addSubview:_lab2];
//
//        self.lab3 = [[UILabel alloc]init];
//        self.lab3.font = [UIFont systemFontOfSize:15];
//        self.lab3.numberOfLines = 0;
//        [self.bgView addSubview:_lab3];
       
        [self.contentView addSubview:_bgView];

    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    self.lab1.frame = CGRectMake(50, 30, self.bgView.bounds.size.width-100,30);
}

-(void)setModelCell:(HomeworkModel *)modelCell{
    _modelCell=modelCell;
    NSString *text;
    
    
    
    if (modelCell.countHw == 1) {
       text = [NSString stringWithFormat:@"%@;",modelCell.homeworkcontent1];
    }
    if (modelCell.countHw == 2) {
        text = [NSString stringWithFormat:@"%@;\n\n%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2];
    }
    if (modelCell.countHw == 3) {
        text = [NSString stringWithFormat:@"%@;\n\n%@;\n\n%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2,modelCell.homeworkcontent3];
    }
    if (modelCell.countHw == 4) {
        text = [NSString stringWithFormat:@"1.%@;\n\n2.%@;\n\n3.%@;\n\n4.%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2,modelCell.homeworkcontent3,modelCell.homeworkcontent4];
    }
    self.lab1.text = modelCell.time;
    self.lab2.text = text;
    CGRect labelSize=[text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
//    CGSize labelSize = [text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(SCREEN_WIDTH-80, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];

    NSLog(@"行高%f,行宽%f", labelSize.size.height, labelSize.size.width);
    
    
   
    self.lab2.frame = CGRectMake(20,95,SCREEN_WIDTH-80, labelSize.size.height);
    NSLog(@"%f",95+labelSize.size.height);
    if (labelSize.size.height + 130 < SCREEN_HEIGHT-64) {
        modelCell.cellHeight = SCREEN_HEIGHT - 64;
    }else{
        modelCell.cellHeight = labelSize.size.height + 130 ;
    }
    
    self.bgView.frame = CGRectMake(20,27 ,SCREEN_WIDTH-40,modelCell.cellHeight-36);

}

-(void)setPic:(NSArray *)pic{
    UILabel *labPic = [[UILabel alloc]init];
    labPic.frame = CGRectMake(20,CGRectGetMaxY(self.lab2.frame)+20,80,15);
    labPic.text = @"· 图片作业:";
    labPic.textColor = COLOR(100,100,100, 1.0);
    labPic.numberOfLines = 0;
    labPic.font = [UIFont systemFontOfSize:15];
    [self.bgView addSubview:labPic];
    
    _pic = pic;
    for (int i = 0; i < _pic.count; i++) {
        UIImageView *hmi = [[UIImageView alloc]init];
        hmi.tag = 10000+i;
        NSLog(@"%f",CGRectGetMaxY(self.lab2.frame));
        int s = i%3;//第几行
        CGFloat width = 70.0/320.0*SCREEN_WIDTH;
        hmi.frame = CGRectMake(30 +5+(width+10)*s,CGRectGetMaxY(self.lab2.frame)+20+35+i/3*(width+10),width, width);
        
        hmi.image = _pic[i];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showImage:)];
        tap.accessibilityValue = [NSString stringWithFormat:@"%ld",(long)hmi.tag];
        hmi.userInteractionEnabled = YES;
        [hmi addGestureRecognizer:tap];
        [self.bgView addSubview:hmi];
    }
    
    if (pic == nil) {
        labPic.hidden = YES;
    }else{
        CGFloat uu = CGRectGetMaxY(self.lab2.frame)+20+70+30+25;
        if (uu > CGRectGetMaxY(self.bgView.frame)) {
            self.cellH = uu;
        }
        labPic.hidden = NO;

    }
}

-(void)showImage:(UITapGestureRecognizer *)tapp{
  long int i =  tapp.accessibilityValue.intValue;
    
    
    UIImageView *imaView = (UIImageView *)[self.contentView viewWithTag:i];
   
    UIImage *image = imaView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[imaView convertRect:imaView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=5000;
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
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:5000];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}




@end
