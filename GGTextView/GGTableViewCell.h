//
//  GGTableViewCell.h
//  GGTextView
//
//  Created by iOSGeekOfChina on 2016/11/29.
//  Copyright © 2016年 geek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGTextView.h"

@class GGTableViewCell;
@protocol GGTableViewCellDelegate <NSObject>

- (void)updataContent:(NSString *)content cellWith:(GGTableViewCell *)cell;

@end

@interface GGTableViewCell : UITableViewCell<GGTextViewDelegate>

@property (nonatomic,assign) id<GGTableViewCellDelegate>delegate;

@property (nonatomic,strong) GGTextView * ggTextView;
@property (strong, nonatomic) IBOutlet UILabel *nickNameLabel;


@end
