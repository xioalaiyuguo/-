//
//  headerViewTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HeaderViewTableViewCell.h"
#import "Define.h"
@implementation HeaderViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.labName = [[UILabel alloc]init];
        self.labName.font =[UIFont systemFontOfSize:15];
//        self.labName.text = @"头像";
        self.headView = [[UIImageView alloc]init];
        self.headView.backgroundColor = [UIColor blueColor];
        self.headView.image = [UIImage imageNamed:@"wo.png"];
        [self.contentView addSubview:self.labName];
        [self.contentView addSubview:self.headView];
        
    }
    return self;
    

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labName.frame = CGRectMake(15.0/320.0*SCREEN_WIDTH, 30.0,100.0/320.0*SCREEN_HEIGHT, 18) ;
    self.headView.frame = CGRectMake(224.0/320.0*SCREEN_WIDTH, 9.0, 60.0, 60.0);
    
}
@end
