//
//  WeBtCell.m
//  tableView
//
//  Created by yangwei cui on 2018/4/13.
//  Copyright © 2018年 David. All rights reserved.
//

#import "WeBtCell.h"
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width

@implementation WeBtCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier =@"WeBtCell";
    WeBtCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[WeBtCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
//初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化代码
        [self designUI];
    }
    return self;
}
//视图层
-(void)designUI{
    self.name=[UILabel new];
    self.name.font=[UIFont boldSystemFontOfSize:16.f];
    
    self.name.frame=CGRectMake(25, 10, kScreenWidth-50, 50);
    [self.contentView addSubview:self.name];
 
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
