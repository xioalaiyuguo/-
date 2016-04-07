//
//  MineThirdTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MineThirdTableViewCell.h"
#import "Define.h"
@implementation MineThirdTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.labName = [[UILabel alloc]init];
        self.labName.font =[UIFont systemFontOfSize:15];

        self.headView = [[UIImageView alloc]init];
//        self.headView.backgroundColor = [UIColor blueColor];
//        self.headView.image = [UIImage imageNamed:@"wo.png"];
        [self.contentView addSubview:self.labName];
        [self.contentView addSubview:self.headView];
        
    }
    return self;
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labName.frame = CGRectMake(52.0/320.0*SCREEN_WIDTH, 13.0,100.0/320.0*SCREEN_HEIGHT, 18) ;
    self.headView.frame = CGRectMake(15.0/320.0*SCREEN_WIDTH, (44.0-20.0/320.0*SCREEN_WIDTH)/2,20.0/320.0*SCREEN_WIDTH,20.0/320.0*SCREEN_WIDTH);
    
}


@end
