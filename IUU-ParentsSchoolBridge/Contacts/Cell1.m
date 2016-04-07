//
//  Cell1.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "Cell1.h"

@implementation Cell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.image = [[UIImageView alloc]init];
        self.label = [[UILabel alloc]init];
        
        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.label];
    }
    
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.image.frame = CGRectMake(15, 10, 50, 50);
    
    self.label.frame = CGRectMake(83, 25, 50, 15);
    
    self.image.layer.cornerRadius = 25.0;
    self.image.clipsToBounds = YES;

   
    
    
}

@end
