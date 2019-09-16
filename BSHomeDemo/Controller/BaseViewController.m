//
//  BaseViewController.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/16.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(UITableView *)tab {
    if (!_tab) {
        UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tab];
        tab.delegate = self;
        tab.dataSource = self;
        tab.rowHeight = 44;
        tab.contentInset = UIEdgeInsetsMake(99, 0, 0, 0 );
        tab.scrollIndicatorInsets = tab.contentInset;
        if (@available(iOS 11.0,*)) {
            tab.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        self.tab =tab;
    }
    return _tab;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
