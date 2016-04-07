//
//  MineSecondTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MineSecondTableViewCell.h"
#import "Define.h"
@implementation MineSecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.labName = [[UILabel alloc]init];
        self.labName.font =[UIFont systemFontOfSize:15];
        self.labName.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.labName];
        
        self.textLab = [[UILabel alloc]init];
        self.textLab.font =[UIFont systemFontOfSize:12];
        self.textLab.textColor = COLOR(85,85 , 85, 1);
//        self.textLab.backgroundColor = [UIColor blueColor];
        self.textLab.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.textLab];

        
    }
    return self;
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labName.frame = CGRectMake(15.0/320.0*SCREEN_WIDTH, 13.0,100.0/320.0*SCREEN_WIDTH, 18) ;
    
    self.textLab.frame = CGRectMake(187.0/320.0*SCREEN_WIDTH, 13.0,90.0/320.0*SCREEN_WIDTH, 18) ;
    
}

@end
