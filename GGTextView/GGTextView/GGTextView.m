//
//  GGTextView.m
//  GGTextView
//
//  Created by iOSGeekOfChina on 2016/11/29.
//  Copyright © 2016年 geek. All rights reserved.
//

#import "GGTextView.h"
#import "TTTAttributedLabel.h"
@interface GGTextView ()<UITextViewDelegate>

@property (nonatomic,strong) UITextView * ggTextView;
@property (nonatomic,strong) TTTAttributedLabel * placeholderLabel;


@end


@implementation GGTextView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createGGTextView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createGGTextView];
    }
    return self;
}

-(UITextView *)ggTextView{
    
    if (!_ggTextView) {
        _ggTextView = [[UITextView alloc]initWithFrame:self.frame];
        _ggTextView.delegate = self;
        _ggTextView.userInteractionEnabled = YES;
    }
    
    return _ggTextView;
}
- (void)setText:(NSString *)text{
    _text = text;
    _placeholderLabel.hidden = YES;
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _ggTextView.textColor = _textColor;
}
- (void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    _ggTextView.font = _textFont;
}

-(TTTAttributedLabel *)placeholderLabel{
    
    if (!_placeholderLabel) {
        _placeholderLabel = [[TTTAttributedLabel alloc]initWithFrame:CGRectMake(15, 8, self.ggTextView.frame.size.width-30, self.ggTextView.frame.size.height-16)];
        _placeholderLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
        _placeholderLabel.userInteractionEnabled = YES;
    }
    return _placeholderLabel;
    
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;

    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:_placeholder];
    //自定义str和TTTAttributedLabel一样的行间距
    NSMutableParagraphStyle *paragrapStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrapStyle setLineSpacing:_LineSpacing];
    //设置行间距
    [attrString addAttribute:NSParagraphStyleAttributeName value:paragrapStyle range:NSMakeRange(0, _placeholder.length)];
    //设置字体
    [attrString addAttribute:NSFontAttributeName value:_placeholderFont range:NSMakeRange(0, _placeholder.length)];
    //颜色
    [attrString addAttribute:NSForegroundColorAttributeName value:_placeholderColor range:NSMakeRange(0, _placeholder.length)];
    
    _placeholderLabel.attributedText = attrString;
    
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    
    [self setPlaceholder:_placeholder];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setPlaceholder:_placeholder];
}
- (void)setLineSpacing:(CGFloat)LineSpacing{
    _LineSpacing = LineSpacing;
    [self setPlaceholder:_placeholder];
    
}
- (void)setLimitCount:(NSString *)limitCount{
    _limitCount = limitCount;
}
- (void)setIsShowLimitCount:(BOOL)isShowLimitCount{
    _isShowLimitCount = isShowLimitCount;
}

- (void)createGGTextView{
    
    _textFont = [UIFont systemFontOfSize:15];
    _textColor = [UIColor blackColor];
    
    _ggTextView.textColor = _textColor;
    _ggTextView.font = _textFont;
    
    _placeholderFont = _textFont;
    _placeholderColor = [UIColor blueColor];
    
    _LineSpacing = 0;
    
    _placeholderLabel.font = _placeholderFont;
    _placeholderLabel.textColor = _placeholderColor;
    _placeholderLabel.lineSpacing = _LineSpacing;
    
    _limitCount = 0;
    _isShowLimitCount = NO;
    

    [self addSubview:self.ggTextView];
    [self.ggTextView addSubview:self.placeholderLabel];
    
    UITapGestureRecognizer * tapPlaceholder = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenPlacehold)];
    [self.placeholderLabel addGestureRecognizer:tapPlaceholder];
    
}

- (void)hiddenPlacehold{
    
    if (!_ggTextView.text.length) {
        _placeholderLabel.hidden = NO;
    }else{
        _placeholderLabel.hidden = YES;
    }
    [_ggTextView becomeFirstResponder];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (!textView.text.length) {
        _placeholderLabel.hidden = NO;
    }else{
        _placeholderLabel.hidden = YES;
    }
    [_delegate ggtextViewDidBeginEditing:self];
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (!textView.text.length) {
        _placeholderLabel.hidden = NO;
    }else{
        _placeholderLabel.hidden = YES;
    }
    [_delegate ggtextViewDidEndEditing:self];
    
}
- (void)textViewDidChange:(UITextView *)textView{
    //字数限制可以在这里
    if (!textView.text.length) {
        _placeholderLabel.hidden = NO;
    }else{
        _placeholderLabel.hidden = YES;
    }
    [_delegate ggtextViewDidChange:self];
    
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    return YES;
}

@end
