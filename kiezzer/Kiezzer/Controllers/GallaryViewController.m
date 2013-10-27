//
//  GallaryViewController.m
//  Kiezzer
//
//  Created by Penergy on 13-10-27.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "GallaryViewController.h"
#import "GallaryViewCell.h"
#import "GallaryDetailViewController.h"

@interface GallaryViewController (){
    //Testing
    NSArray *arrayCollectionImages;
}

@end

@implementation GallaryViewController

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
    
    arrayCollectionImages = [[NSArray alloc]initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    GallaryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gallaryCell" forIndexPath:indexPath];
    cell.gallaryImage.image=[UIImage imageNamed:[arrayCollectionImages objectAtIndex:indexPath.item]];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrayCollectionImages count];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collectionView:(UICollectionView *)collectionView  didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger currentRow = indexPath.row;
    NSString *picName = [arrayCollectionImages objectAtIndex:currentRow];
    
    GallaryDetailViewController * gallaryDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"gallaryDetail"];
    gallaryDetail.imageURL =picName;

    [self.navigationController pushViewController:gallaryDetail animated:YES];

       }

@end
