//
//  ClubTableViewController.m
//  Kiezzer
//
//  Created by Penergy on 13-10-23.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "ClubsTableViewController.h"
#import "DetailViewController.h"
#import "ClubCell.h"

@interface ClubsTableViewController ()

@end

@implementation ClubsTableViewController

@synthesize clubs;

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
    [self.navigationItem setTitle:@"Kiez"];
    ///--------------------------------------------
    /// example data
    ///--------------------------------------------
    
    /*clubs = [NSMutableArray arrayWithCapacity:20];
    Club *club = [[Club alloc] init];
    club.name = @"Bill Evans";
    club.location = @"Tic-Tac-Toe";
    club.rating = 0.4;
    club.orderType =  1;
    [clubs addObject:club];
    club = [[Club alloc] init];
    club.name = @"Oscar Peterson";
    club.location = @"Spin the Bottle";
    club.rating = 0.5;
    club.orderType =  1;
    [clubs addObject:club];
    club = [[Club alloc] init];
    club.name = @"Dave Brubeck";
    club.location = @"Texas Hold’em Poker";
    club.rating = 0.2;
    club.orderType =  1;
    [clubs addObject:club];*/
    
    /*self.clubs = clubs;*/
    
    //[self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    /*photoButton = [[UIBarButtonItem alloc]
                   initWithTitle:@"photo"
                   style:UIBarButtonItemStylePlain
                   target:self
                   action:@selector(addPhoto:)];
    
    sortByButton = [[UIBarButtonItem alloc]
                    initWithTitle:@"sortby"
                    style:UIBarButtonItemStylePlain
                    target:self
                    action:@selector(sortBy:)];
    
    NSArray *arrBtns = [[NSArray alloc]initWithObjects:photoButton,sortByButton, nil];
    self.navigationItem.rightBarButtonItems = arrBtns;*/
    
    //[anotherButton release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageForRating:(int)orderType
{
	switch (orderType)
	{
		case 1: return [UIImage imageNamed:@"1StarsSmall.png"];
		case 2: return [UIImage imageNamed:@"tem.png"];
		case 3: return [UIImage imageNamed:@"1StarsSmall.png"];
	}
	return nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ClubCell";
    
    ClubCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ClubCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    /*CGFloat x = cell.frame.origin.x;
    CGFloat y = cell.frame.origin.y;
    CGFloat height = cell.frame.size.height;
    CGFloat width = cell.frame.size.width;
    
    // Configure the cell...
    Club *club = [self.clubs objectAtIndex:indexPath.row];
	cell.nameLabel.text = club.name;
	cell.locationLabel.text = club.location;
	cell.ratingImageView.image = [self imageForRating:club.orderType];
    
    *//*
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(x+120, y+height/2-5, 50, 10)];
    test.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:test];
     */
    
    return cell;
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
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
