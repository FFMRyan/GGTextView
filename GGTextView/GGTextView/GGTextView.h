//
//  GGTextView.h
//  GGTextView
//
//  Created by iOSGeekOfChina on 2016/11/29.
//  Copyright © 2016年 geek. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GGTextView;
@protocol GGTextViewDelegate <NSObject>

-(void)ggtextViewDidBeginEditing:(GGTextView *)textView;

-(void)ggtextViewDidEndEditing:(GGTextView *)textView;

-(void)ggtextViewDidChange:(GGTextView *)textView;

@end



@interface GGTextView : UIView

@property (nonatomic,assign) id<GGTextViewDelegate>delegate;

//内容
@property (nonatomic,strong) NSString * text;
//文字颜色
@property (nonatomic,strong) UIColor * textColor;
//文字字体
@property (nonatomic,strong) UIFont * textFont;

//是否有提示 不赋值即不显示
@property (nonatomic,strong) NSString * placeholder;
//提示颜色 默认是 8f8f8f
@property (nonatomic,strong) UIColor * placeholderColor;
//提示字体 默认是 15
@property (nonatomic,strong) UIFont * placeholderFont;

//行间距  默认为 0
@property (nonatomic,assign) CGFloat LineSpacing;

//字数是否限制 默认不限制 赋值则限制
@property (nonatomic,strong) NSString * limitCount;
//是否显示正在输入文字 默认不显示  显示会自动计数
@property (nonatomic,assign) BOOL isShowLimitCount;

@end
