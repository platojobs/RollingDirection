//
//  WeBtCell.h
//  tableView
//
//  Created by yangwei cui on 2018/4/13.
//  Copyright © 2018年 David. All rights reserved.
//
//随便写的测试cell
#import <UIKit/UIKit.h>

@interface WeBtCell : UITableViewCell

@property(nonatomic,strong)UILabel*name;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
