//
//  ViewController.m
//  tableView
//
//  Created by yangwei cui on 2018/4/13.
//  Copyright © 2018年 David. All rights reserved.
//

#import "ViewController.h"
#import "WeBtCell.h"
#define ScreenWidth   self.view.bounds.size.width
#define SCreenHeight  self.view.bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    //首先为UITableView添加观察者
    [self.tableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: nil];
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

//在KVO中，根据UITableView对象的相关属性，完成UITableView滚动方向的判断

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass: [UITableView class]]) {
        CGPoint newPoint = [change[@"new"] CGPointValue];
        CGPoint oldPoint = [change[@"old"] CGPointValue];
        CGFloat newPointY = newPoint.y;
        CGFloat oldPointY = oldPoint.y;
        CGFloat frameHeight = ((UITableView *)object).frame.size.height;
        CGFloat contentSizeHeight = ((UITableView *)object).contentSize.height;
        
        //  这个地方把contentSizeHeight强制转为long类型很重要，因为本身它是CGFloat类型，所以可能会带有浮点数
        // 一般我们在做表格的时候，实际上整型数居多，为什么用long而不是int，主要是表示的整数范围会更大
        if ((newPointY < oldPointY && (frameHeight + newPointY) < (long)contentSizeHeight) || newPointY < 0 || oldPointY < 0) {
            if (newPointY <= 0 || oldPointY <= 0) {
                NSLog(@"top");
            } else {
                NSLog(@"scroll down");
            }
        } else if (newPointY > oldPointY) {
            if ((frameHeight + newPointY >= contentSizeHeight)) {
                NSLog(@"bottom");
            } else {
                NSLog(@"scroll up");
            }
        }
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeBtCell*cell=[WeBtCell cellWithTableView:tableView];
    cell.name.text=[NSString stringWithFormat:@"我是%ld行",indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, SCreenHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=65;
    [_tableView registerClass:[WeBtCell class] forCellReuseIdentifier:[WeBtCell description]];
    }
    return  _tableView;
}
@end
