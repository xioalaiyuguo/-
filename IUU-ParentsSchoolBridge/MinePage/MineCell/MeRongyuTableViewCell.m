//
//  MeRongyuTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MeRongyuTableViewCell.h"
#import "Define.h"
#define WWIETHX(x)   [UIScreen mainScreen].bounds.size.width*(x)/320
@interface MeRongyuTableViewCell ()

@property (strong, nonatomic)  UIImageView *bgImg;
@property (strong, nonatomic)  UIView *quan;
/**  分割线 */
@property (strong, nonatomic) UIView *line;

@end
@implementation MeRongyuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.yueLab = [[UILabel alloc]init];
        self.DayLab = [[UILabel alloc]init];
        self.yueLab.textAlignment =NSTextAlignmentLeft;
        self.DayLab.textAlignment = NSTextAlignmentRight;
        self.yueLab.font = [UIFont systemFontOfSize:15];
        self.DayLab.font = [UIFont systemFontOfSize:13];
        self.yueLab.textColor = COLOR(135, 135, 135, 1);
        self.DayLab.textColor = COLOR(135, 135, 135, 1);
        
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor =COLOR(135, 135, 135, 1);
        
        self.quan = [[UIView alloc]init];
        self.quan.backgroundColor =COLOR(135, 135, 135, 1);
        
        
        self.bgImg = [[UIImageView alloc]init];
        self.bgImg.image = [UIImage imageNamed:@"u=2070269357,1957453008&fm=21&gp=0.jpg"];
        self.contentLab = [[UILabel alloc]init];
        //        self.contentLab.textAlignment = NSTextAlignmentCenter;
        self.contentLab.numberOfLines = 0;
        
        
        [self.contentView addSubview:_yueLab];
        [self.contentView addSubview:_DayLab];
        
        [self.contentView addSubview:_line];
        
        [self.contentView addSubview:_quan];
        
        [self.contentView addSubview:_bgImg];
        
        [self.contentView addSubview:_contentLab];
        
        
    }
    return self;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat h = self.contentView.frame.size.height;
    
    
    self.yueLab.frame = CGRectMake(WWIETHX(10), 20, WWIETHX(40), 20);
    
    self.DayLab.frame = CGRectMake(WWIETHX(10), 40, WWIETHX(40), 20);
    
    self.line.frame = CGRectMake(WWIETHX(70), 0, WWIETHX(1), h);
    self.quan.frame = CGRectMake(WWIETHX(70-5), (h-WWIETHX(10))/2, WWIETHX(10),WWIETHX(10));
    self.quan.layer.cornerRadius = self.quan.frame.size.width/2;
    self.bgImg.frame= CGRectMake(WWIETHX(85), 10, WWIETHX(320-10-85), h-20);
    
    self.contentLab.frame = CGRectMake(WWIETHX(105), 20, WWIETHX(320-10-125), h-40);
    self.contentLab.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
}



@end
