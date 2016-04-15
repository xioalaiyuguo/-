//
//  UIPlaceholderTextView.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/14.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "UIPlaceholderTextView.h"

@implementation UIPlaceholderTextView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.frame = frame;
        [self awakeFromNib];
    }
    return self;
}

-(void)awakeFromNib{
    [self addObserver];
}

-(void)addObserver{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidBeginEnding:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidBeginEnding:) name:UITextViewTextDidEndEditingNotification object:self];
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)textDidBeginEnding:(NSNotification *)notification{
    if ([super.text isEqualToString:_placeholder]) {
        super.text = @"";
        [super setTextColor:[UIColor blackColor]];
    }
}

-(void)textDidEndEnding:(NSNotification *)notification{
    if (super.text.length == 0) {
        super.text = _placeholder;
        [super setTextColor:[UIColor lightGrayColor]];
    }
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    [self textDidEndEnding:nil];
}

-(NSString *)text{
    NSString *text = [super text];
    if ([text isEqualToString:_placeholder]) {
        return @"";
    }
    return text;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

@end
