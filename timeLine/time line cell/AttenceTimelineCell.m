//
//  AttenceTimelineCell.m
//  Product
//
//  Created by ACTIVATION GROUP on 14-8-7.
//  Copyright (c) 2014年 eKang. All rights reserved.
//

#import "AttenceTimelineCell.h"

@implementation AttenceTimelineCell

#define DotViewCentX 20//圆点中心 x坐标
#define VerticalLineWidth 2//时间轴 线条 宽度
#define ShowLabTop 10//cell间距
#define ShowLabWidth (320 - DotViewCentX - 20)
#define ShowLabFont [UIFont systemFontOfSize:15]

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        verticalLineTopView = [[UIView alloc] init];
        verticalLineTopView.backgroundColor = [UIColor grayColor];
        [self addSubview:verticalLineTopView];
        
        int dotViewRadius = 5;
        dotView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, dotViewRadius * 2, dotViewRadius * 2)];
        dotView.backgroundColor = [UIColor orangeColor];
        dotView.layer.cornerRadius = dotViewRadius;
        [self addSubview:dotView];
        
        verticalLineBottomView = [[UIView alloc] init];
        verticalLineBottomView.backgroundColor = [UIColor grayColor];
        [self addSubview:verticalLineBottomView];
        
        showLab = [[UIButton alloc] init];
        UIImage *img = [UIImage imageNamed:@"AttenceTimelineCellMessage2"];
        img = [img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
        [showLab setBackgroundImage:img forState:UIControlStateNormal];
        showLab.titleLabel.font = ShowLabFont;
        showLab.titleLabel.numberOfLines = 20;
        showLab.titleLabel.textAlignment = NSTextAlignmentLeft;
        showLab.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        showLab.titleEdgeInsets = UIEdgeInsetsMake(5, 15, 5, 5);
        [self addSubview:showLab];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    super.frame = frame;
    dotView.center = CGPointMake(DotViewCentX, ShowLabTop + 13);
    int cutHeight = dotView.frame.size.height/2.0 - 2;
    verticalLineTopView.frame = CGRectMake(DotViewCentX - VerticalLineWidth/2.0, 0, VerticalLineWidth, dotView.center.y - cutHeight);
    verticalLineBottomView.frame = CGRectMake(DotViewCentX - VerticalLineWidth/2.0, dotView.center.y + cutHeight, VerticalLineWidth, frame.size.height - (dotView.center.y + cutHeight));
}

- (void)setDataSource:(NSString *)content isFirst:(BOOL)isFirst isLast:(BOOL)isLast {
    showLab.frame = CGRectMake(DotViewCentX - VerticalLineWidth/2.0 + 5, ShowLabTop, ShowLabWidth, [AttenceTimelineCell cellHeightWithString:content isContentHeight:YES]);
    [showLab setTitle:content forState:UIControlStateNormal];
    
    verticalLineTopView.hidden = isFirst;
    verticalLineBottomView.hidden = isLast;
    dotView.backgroundColor = isFirst ? [UIColor orangeColor] : [UIColor grayColor];
    
    UIImage *img = [UIImage imageNamed:isFirst ? @"AttenceTimelineCellMessage" : @"AttenceTimelineCellMessage2"];
    img = [img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    [showLab setBackgroundImage:img forState:UIControlStateNormal];
}

+ (float)cellHeightWithString:(NSString *)content isContentHeight:(BOOL)b{
    float height = [content sizeWithFont:ShowLabFont constrainedToSize:CGSizeMake(ShowLabWidth - 20, 100)].height;
    return (b ? height : (height + ShowLabTop * 2)) + 15;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
