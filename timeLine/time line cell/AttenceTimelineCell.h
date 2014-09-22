//
//  AttenceTimelineCell.h
//  Product
//
//  Created by ACTIVATION GROUP on 14-8-7.
//  Copyright (c) 2014年 eKang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttenceTimelineCell : UITableViewCell{
    UIView *verticalLineTopView;
    UIView *dotView;
    UIView *verticalLineBottomView;
    
    UIButton *showLab;
}

+ (float)cellHeightWithString:(NSString *)str isContentHeight:(BOOL)b;

- (void)setDataSource:(NSDictionary *)dic isFirst:(BOOL)isFirst isLast:(BOOL)isLast;

@end
