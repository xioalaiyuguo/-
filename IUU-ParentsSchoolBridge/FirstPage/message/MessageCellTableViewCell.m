//
//  MessageCellTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MessageCellTableViewCell.h"
#import "Define.h"
@implementation MessageCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.titleLabel = [[UILabel alloc]init];
        self.detailLabel = [[UILabel alloc]init];
        self.timeLabel =  [[UILabel alloc]init];
        self.label1 = [[UILabel alloc]init];
        self.label2 = [[UILabel alloc]init];
        self.label3 = [[UILabel alloc]init];
        
        self.view1 = [[UIView alloc]init];
        
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        
        self.timeLabel.font = FONT(12);
        self.titleLabel.font = FONT(15);
        
        self.detailLabel.font = FONT(13);
        self.label3.font = FONT(13);
        self.label2.font = FONT(13);
        self.label1.font = FONT(13);
        
//        self.detailLabel.textColor = COLOR(50, 50, 50, 1);
        
        self.detailLabel.numberOfLines = 0;
        
        self.timeLabel.textColor = [UIColor whiteColor];
        
        self.view1.layer.cornerRadius = 5;
        self.timeLabel.layer.cornerRadius = 5;
        self.timeLabel.clipsToBounds = YES;
        
        self.view1.backgroundColor = [UIColor whiteColor];
        
        self.timeLabel.backgroundColor = COLOR(215, 215, 215, 1);

        
        [self.contentView addSubview:_view1];
        [self.contentView addSubview:_timeLabel];
        [self.view1 addSubview:_detailLabel];
        [self.view1 addSubview:_titleLabel];
        [self.view1 addSubview:_label1];
        [self.view1 addSubview:_label2];
        [self.view1 addSubview:_label3];
        
        self.contentView.backgroundColor = COLOR(239, 239, 239, 1);
       
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //变化的frame
    self.view1.frame = CGRectMake(20, 50, SCREEN_WIDTH-40, self.contentView.frame.size.height-60);
    self.detailLabel.frame = CGRectMake(10, 85, SCREEN_WIDTH-60, self.contentView.frame.size.height-60-45-75);
    self.label3.frame = CGRectMake(10, 5+85+self.contentView.frame.size.height-60-45-75, 120, 20);
    
    //不变的frame
    self.timeLabel.frame = CGRectMake(100, 20, SCREEN_WIDTH-200, 20);
    self.titleLabel.frame = CGRectMake(10, 10, SCREEN_WIDTH-40-20, 20);
    self.label1.frame = CGRectMake(10, 35, 80, 20);
    self.label2.frame = CGRectMake(10, 60, 150, 20);
    
    

}

@end
