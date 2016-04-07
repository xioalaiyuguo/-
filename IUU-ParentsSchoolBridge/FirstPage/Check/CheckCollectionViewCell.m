//
//  CheckCollectionViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "CheckCollectionViewCell.h"

@implementation CheckCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.numLabel = [[UILabel alloc]init];
        
        self.numLabel.textAlignment = NSTextAlignmentCenter;
        self.numLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_numLabel];
        
    }
    return self;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.numLabel.frame = self.bounds;

}
@end
