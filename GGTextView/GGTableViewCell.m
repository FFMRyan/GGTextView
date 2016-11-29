//
//  GGTableViewCell.m
//  GGTextView
//
//  Created by iOSGeekOfChina on 2016/11/29.
//  Copyright © 2016年 geek. All rights reserved.
//

#import "GGTableViewCell.h"


@implementation GGTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.ggTextView = [[GGTextView alloc]initWithFrame:CGRectMake(self.nickNameLabel.frame.origin.x+self.nickNameLabel.frame.size.width+15, 5, self.frame.size.width-self.nickNameLabel.frame.origin.x-self.nickNameLabel.frame.size.width-30, self.frame.size.height-10)];
    self.ggTextView.delegate = self;
    [self.contentView addSubview:self.ggTextView];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)ggtextViewDidChange:(GGTextView *)textView{
    
}
-(void)ggtextViewDidBeginEditing:(GGTextView *)textView{
    
}
-(void)ggtextViewDidEndEditing:(GGTextView *)textView{
    [_delegate updataContent:textView.text cellWith:self];
}

@end
