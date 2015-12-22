//
//  ViewController.m
//  CoolHUD
//
//  Created by legendry on 15/12/4.
//  Copyright © 2015年 legendry. All rights reserved.
//

#import "ViewController.h"
#import "CHView.h"

@interface ViewController ()
@property(nonatomic,strong)CHView* chView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor] ;
    self.chView = [[CHView alloc] initWithFrame:self.view.bounds] ;
    [self.view addSubview:self.chView] ;

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated] ;
    [self.chView showProgress] ;

}

@end
