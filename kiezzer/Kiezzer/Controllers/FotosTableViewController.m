//
//  FotosTableViewController.m
//  Kiezzer
//
//  Created by He Yongfeng on 13-10-26.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "FotosTableViewController.h"
#import "FotosTableViewCell.h"
#import "GallaryViewController.h"
#import "CameraViewController.h"

@interface FotosTableViewController ()

@end

@implementation FotosTableViewController{
    UIBarButtonItem *photoButton;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // add a Photo button
    photoButton = [[UIBarButtonItem alloc]
                   initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                   target:self action:@selector(intoPhoto:)];
    self.navigationItem.rightBarButtonItem = photoButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Fotos"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FotosTableCell";
    NSLog(@"okay1");
    FotosTableViewCell *cell = (FotosTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[FotosTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.cellBkImage.image =[UIImage imageNamed:@"Property_night_club.png"];
    cell.cellWhiteBkImage.image = [UIImage imageNamed:@"whiteColor.png"];
    [cell.cellWhiteBkImage setAlpha:0.45];
    cell.clubNameLabel.text = @"Arena";
    //[cell.clubNameLabel setBackgroundColor:[UIColor clearColor]];
    //[(UILabel *)[cell.contentView viewWithTag:1] setText:[data1 objectAtIndex:indexPath.row]];
    NSLog(@"okay");
    // Configure the cell...
    
    return cell;
}

- (IBAction)intoPhoto:(id)sender{
    
    CameraViewController *cameraVC = [self.storyboard instantiateViewControllerWithIdentifier:@"cameraVC"];
    [self.navigationController pushViewController:cameraVC animated:YES];
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GallaryViewController *gallaryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"gallaryVC"];
    [self.navigationController pushViewController:gallaryVC animated:YES];
}

@end
