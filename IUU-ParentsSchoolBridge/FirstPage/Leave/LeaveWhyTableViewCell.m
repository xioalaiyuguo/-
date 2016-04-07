//
//  LeaveWhyTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "LeaveWhyTableViewCell.h"
#import "Define.h"
@implementation LeaveWhyTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.whyText = [[UITextView alloc]init];
        self.whyText.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:_whyText];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.whyText.frame = CGRectMake(0, 0, SCREEN_WIDTH,100);
}
@end
