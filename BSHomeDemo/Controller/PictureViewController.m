//
//  PictureViewController.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/16.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
    [self.tab reloadData];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"图片第%zd行",indexPath.row];
    return cell;
    
}


@end
