//
//  VideoViewController.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/16.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tab reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"视频第%zd行",indexPath.row];
    return cell;
    
}

@end
