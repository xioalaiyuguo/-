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
@end


@implementation OneHomeworkTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.backgroundColor = COLOR(248, 248, 248, 1);
        self.bgView = [[UIView alloc]init];
        self.bgView.backgroundColor = [UIColor whiteColor];
    
        self.bgView.layer.cornerRadius = 5;
        
        self.lab1 = [[UILabel alloc]init];
        self.lab1.font = [UIFont systemFontOfSize:15];
        self.lab1.backgroundColor = COLOR(223, 223, 223, 1);
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
       text = [NSString stringWithFormat:@"1.%@;",modelCell.homeworkcontent1];
    }
    if (modelCell.countHw == 2) {
        text = [NSString stringWithFormat:@"1.%@;\n\n2.%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2];
    }
    if (modelCell.countHw == 3) {
        text = [NSString stringWithFormat:@"1.%@;\n\n2.%@;\n\n3.%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2,modelCell.homeworkcontent3];
    }
    if (modelCell.countHw == 4) {
        text = [NSString stringWithFormat:@"1.%@;\n\n2.%@;\n\n3.%@;\n\n4.%@;",modelCell.homeworkcontent1,modelCell.homeworkcontent2,modelCell.homeworkcontent3,modelCell.homeworkcontent4];
    }
    self.lab1.text = modelCell.time;
    self.lab2.text = text;
    CGSize labelSize = [text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(SCREEN_WIDTH-80, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
//    CGSize titleSize = [text sizeWithFont:self.lab2.font constrainedToSize:CGSizeMake(320, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    NSLog(@"行高%f,行宽%f", labelSize.height, labelSize.width);
    
    
   
    self.lab2.frame = CGRectMake(20,95,SCREEN_WIDTH-80, labelSize.height);
    if (labelSize.height + 130 < SCREEN_HEIGHT-64) {
        modelCell.cellHeight = SCREEN_HEIGHT - 64;
    }else{
        modelCell.cellHeight = labelSize.height + 130 ;
    }
    
    self.bgView.frame = CGRectMake(20,27 ,SCREEN_WIDTH-40,modelCell.cellHeight-36 );
    


}
@end
