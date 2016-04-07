//
//  HistoryCellTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/1.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HistoryCellTableViewCell.h"
#import "Define.h"
@implementation HistoryCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        self.starTime = [[UILabel alloc]init];
        self.endTime = [[UILabel alloc]init];
        self.because = [[UILabel alloc]init];
        self.code = [[UILabel alloc]init];
        
        self.starLabel = [[UILabel alloc]init];
        self.endLabel = [[UILabel alloc]init];
        self.becauseLabel = [[UILabel alloc]init];
        self.codeLabel = [[UILabel alloc]init];
        
        self.view1 = [[UIView alloc]init];
        
        self.view1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        self.becauseLabel.numberOfLines = 0;
        
        self.starTime.font = FONT(15);
        self.endTime.font = FONT(15);
        self.because.font = FONT(15);
        self.code.font = FONT(15);
        
        self.starLabel.font = FONT(12);
        self.endLabel.font = FONT(12);
        self.becauseLabel.font = FONT(12);
        self.codeLabel.font = FONT(12);
        
        self.starLabel.textColor = [UIColor grayColor];
        self.endLabel.textColor = [UIColor grayColor];
        self.becauseLabel.textColor = [UIColor grayColor];
        self.codeLabel.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_starTime];
        [self.contentView addSubview:_endTime];
        [self.contentView addSubview:_because];
        [self.contentView addSubview:_code];
        [self.contentView addSubview:_starLabel];
        [self.contentView addSubview:_endLabel];
        [self.contentView addSubview:_becauseLabel];
        [self.contentView addSubview:_codeLabel];
        
        [self.contentView addSubview:_view1];
    }
    
    return  self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    self.starTime.frame = CGRectMake(10, 10, 70, 20);
    self.endTime.frame = CGRectMake(10, 35, 70, 20);
    self.because.frame = CGRectMake(10, 85, 70, 20);
    self.code.frame = CGRectMake(10, 60, 70, 20);
    
    self.starLabel.frame = CGRectMake(90, 10, SCREEN_WIDTH-90, 20);
    self.endLabel.frame = CGRectMake(90, 35, SCREEN_WIDTH-90, 20);
    
    self.codeLabel.frame = CGRectMake(90, 60, SCREEN_WIDTH-90, 20);
    
    //变化
    self.becauseLabel.frame = CGRectMake(90, 85, SCREEN_WIDTH-100, self.contentView.frame.size.height-95);
    self.view1.frame = CGRectMake(0, self.contentView.frame.size.height-1, SCREEN_WIDTH, 1);
    
    
}
@end
