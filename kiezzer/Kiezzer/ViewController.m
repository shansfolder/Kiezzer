//
//  ViewController.m
//  Kiezzer
//
//  Created by Penergy on 13-10-23.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "ViewController.h"
#import "ClubsTableViewController.h"
#import "FotosTableViewController.h"

@interface ViewController (){

}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clubButton:(id)sender {
    ClubsTableViewController *clubsTabelVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ClubsTable"];
    [self.navigationController pushViewController:clubsTabelVC animated:YES];
    
}

- (IBAction)userButton:(id)sender {
    FotosTableViewController *fotosTableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FotosTable"];
    [self.navigationController pushViewController:fotosTableVC animated:YES];
}


@end
