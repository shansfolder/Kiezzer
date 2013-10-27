//
//  GallaryDetailViewController.m
//  Kiezzer
//
//  Created by He Yongfeng on 13-10-27.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "GallaryDetailViewController.h"

@interface GallaryDetailViewController ()

@end

@implementation GallaryDetailViewController

@synthesize gallaryImage;

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
    NSLog(@"%@", self.imageURL);
    self.gallaryImage.image = [UIImage imageNamed:self.imageURL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
