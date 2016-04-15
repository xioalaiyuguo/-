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
        
        self.text1 = [[UITextField alloc]init];
        self.text1.tag = 6001;
//        self.text1.backgroundColor = [UIColor yellowColor];
        
        self.text1.font =[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_text1];
        
        self.text2 = [[UITextView alloc]init];
        
//           self.text2.backgroundColor = [UIColor yellowColor];
      
        self.text2.font =[UIFont systemFontOfSize:12];
        self.text2.scrollEnabled = YES;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:12],
                                     NSParagraphStyleAttributeName:paragraphStyle,
                                     NSForegroundColorAttributeName:COLOR(200, 200, 200, 1)
                                     };

        self.text2.attributedText = [[NSAttributedString alloc]initWithString:@"详细地址" attributes:attributes];
        [self.contentView addSubview:_text2];

    }
    return self;
    
    
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.labName.frame = CGRectMake(15.0/320.0*SCREEN_WIDTH, 13.0,150.0/320.0*SCREEN_WIDTH, 18) ;
    
    self.textLab.frame = CGRectMake(187.0/320.0*SCREEN_WIDTH, 13.0,90.0/320.0*SCREEN_WIDTH, 18) ;
    
    self.text1.frame = CGRectMake(80.0/320.0*SCREEN_WIDTH, 13,230.0/320.0*SCREEN_WIDTH , 18);
    self.text2.frame = CGRectMake(77.0/320.0*SCREEN_WIDTH, 8,230.0/320.0*SCREEN_WIDTH , 36);

}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"000000000000");
}

@end
