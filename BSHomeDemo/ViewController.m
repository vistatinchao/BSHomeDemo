//
//  ViewController.m
//  BSHomeDemo
//
//  Created by 邹超 on 2019/9/12.
//  Copyright © 2019 邹超. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"
#import "AllViewController.h"
#import "PictureViewController.h"
#import "VideoViewController.h"
#import "VoiceViewController.h"
#import "JokesViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIButton *lastSelectBtn;
@property (nonatomic,weak)UIView *indicatorView;
@property (nonatomic,weak)UIView *titlesView;
@property (nonatomic,weak)UIScrollView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"demo";
//    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    [self setChildViewController];
     [self setContentView];
     [self setTitlesView];

    if (@available(iOS 11.0,*)) {
        self.contentView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)setChildViewController {
    AllViewController *allVc = [[AllViewController alloc]init];
    [self addChildViewController:allVc];
    PictureViewController *picVc = [[PictureViewController alloc]init];
    [self addChildViewController:picVc];
    VideoViewController *videoVc = [[VideoViewController alloc]init];
    [self addChildViewController:videoVc];
    VoiceViewController *voiceVc = [[VoiceViewController alloc]init];
    [self addChildViewController:voiceVc];
    JokesViewController *jokeVc = [[JokesViewController alloc]init];
    [self addChildViewController:jokeVc];
}


- (void)btnClick:(UIButton *)btn {
     self.lastSelectBtn.enabled = YES;
    btn.enabled = NO;
    self.lastSelectBtn = btn;
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorView.width = btn.titleLabel.width;
        self.indicatorView.bs_centerX = btn.bs_centerX;
    }];
    CGPoint contentP = self.contentView.contentOffset;
    contentP.x = btn.tag*self.contentView.width;
    [self.contentView setContentOffset:contentP animated:YES];
    [self scrollViewDidEndScrollingAnimation:self.contentView];
}

#pragma mark -
#pragma mark 改变偏移量后会来到这里 滚完再添加view
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/self.contentView.width;
    UIViewController *vc = self.childViewControllers[index];
    [self.contentView addSubview:vc.view];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    NSLog(@"vcView:%@",NSStringFromCGRect(vc.view.frame));
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    [self btnClick:self.titlesView.subviews[index]];
}

#pragma mark - ui
- (void)setTitlesView {
    UIView *titlesView = [[UIView alloc]init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:titlesView];
    titlesView.x = 0;
    titlesView.y = 64;
    titlesView.width = self.view.width;
    titlesView.height = 35;
    
    UIView *indicatorView = [[UIView alloc]init];
    [titlesView addSubview:indicatorView];
    indicatorView.height = 2;
    indicatorView.y = titlesView.height - indicatorView.height;
    indicatorView.backgroundColor = [UIColor redColor];
    self.indicatorView = indicatorView;
    
    NSArray *titles = @[@"全部",@"图片",@"视频",@"声音",@"段子"];
    CGFloat titleBtnX = 0;
    CGFloat titleBtnY = 0;
    CGFloat titleBtnW = self.view.width/titles.count;
    CGFloat titleBtnH = titlesView.height;
    for (NSInteger i=0; i<titles.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        [titlesView addSubview:btn];
        btn.tag = i;
        titleBtnX = i*titleBtnW;
        btn.frame = CGRectMake(titleBtnX, titleBtnY, titleBtnW, titleBtnH);
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            [btn layoutIfNeeded];
            [self btnClick:btn];
        }
        //        titlesView
    }
    [titlesView bringSubviewToFront:indicatorView];
    self.titlesView = titlesView;
}

- (void)setContentView {
    UIScrollView *contentS = [[UIScrollView alloc]init];
    [self.view insertSubview:contentS atIndex:0];
    contentS.frame = self.view.bounds;
    contentS.contentSize = CGSizeMake(self.childViewControllers.count*self.view.width, 0);
    contentS.showsVerticalScrollIndicator = NO;
    contentS.showsHorizontalScrollIndicator = NO;
    contentS.pagingEnabled = YES;
    contentS.delegate = self;
    self.contentView = contentS;
    NSLog(@"sre:%@",NSStringFromCGRect(contentS.frame));
}


@end
