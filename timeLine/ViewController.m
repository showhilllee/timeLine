//
//  ViewController.m
//  timeLine
//
//  Created by ACTIVATION GROUP on 14-9-10.
//  Copyright (c) 2014年 WZC. All rights reserved.
//

#import "ViewController.h"
#import "AttenceTimelineCell.h"

@implementation UIView (category)
- (void)borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}
@end

@interface ViewController ()

@end

@implementation ViewController

#define dataSourceArr @[@"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功", @"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功", @"06-13 16:31 提交至店长 shopmanagerA, 确认完毕", @"06-13 16:31 上班考勤 提交成功"]

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSourceArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [AttenceTimelineCell cellHeightWithString:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isContentHeight:NO];
}

#define TableViewCellID @"TableViewCellID"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AttenceTimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellID];
    
    bool isFirst = indexPath.row == 0;
    bool isLast = indexPath.row == dataSourceArr.count - 1;
    [cell setDataSource:dataSourceArr[dataSourceArr.count - 1 - indexPath.row] isFirst:isFirst isLast:isLast];
//    [cell borderColor:[UIColor orangeColor] borderWidth:1 cornerRadius:0];
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

@end
