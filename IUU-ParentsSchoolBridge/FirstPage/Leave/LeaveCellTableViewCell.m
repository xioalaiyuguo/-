//
//  LeaveCellTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "LeaveCellTableViewCell.h"
#import "Define.h"
@implementation LeaveCellTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.typeLabel = [[UILabel alloc]init];
        self.writeLabel1 = [[UILabel alloc]init];
        self.writeLabel2 = [[UILabel alloc]init];
        
        self.typeLabel.font = FONT(15);
        self.writeLabel2.font = FONT(13);
        self.writeLabel1.font = FONT(13);
        
        self.writeLabel1.textColor = [UIColor grayColor];
        self.writeLabel2.textColor = [UIColor grayColor];
        self.writeLabel1.textAlignment = NSTextAlignmentRight;
        self.writeLabel2.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_typeLabel];
        [self.contentView addSubview:_writeLabel1];
        [self.contentView addSubview:_writeLabel2];
        
        
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.typeLabel.frame = CGRectMake(10, 10, 60, 15);
    self.writeLabel1.frame = CGRectMake(150, 10, SCREEN_WIDTH-150-30, 15);
    self.writeLabel2.frame = CGRectMake(75, 10, 40, 15);
    
}
@end
