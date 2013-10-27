//
//  ActivityIndicatorViewController.m
//  Kiezzer
//
//  Created by He Yongfeng on 13-10-27.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()

@end

@implementation ActivityIndicatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.layer.borderWidth = 2.0f;
    self.view.layer.borderColor = [UIColor grayColor].CGColor;
    self.view.layer.cornerRadius = 10.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
