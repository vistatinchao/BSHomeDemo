//
//  AllViewController.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/16.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "AllViewController.h"

@interface AllViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tab reloadData];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"全部第%zd行",indexPath.row];
    return cell;
    
}


@end
