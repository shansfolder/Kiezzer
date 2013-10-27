//
//  DetailViewController.m
//  Kiezzer
//
//  Created by He Yongfeng on 13-10-26.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "DetailViewController.h"
#import "GeneralDataViewController.h"
#import "AFNetworking.h"
#import "ActivityIndicatorViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //add ActivityIndicatorViewController Subview
    ActivityIndicatorViewController *ActivityIndicator = [self.storyboard instantiateViewControllerWithIdentifier:@"ActivityIndicator"];
    ActivityIndicator.view.tag = 10;
    ActivityIndicator.view.alpha = 0;
    ActivityIndicator.view.frame = CGRectMake(120, 120, 80, 80);
    [self.view addSubview:ActivityIndicator.view];
    [UIView animateWithDuration:1 animations:^{
        ActivityIndicator.view.alpha = 1;
    }];
    
    //use afnetworking get json data
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://data.kiezzer.com/latest/74bbf3bedbbb1050e90503a6cf54705e" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [[self.view viewWithTag:10] removeFromSuperview];
        
        //mapView
        NSArray *coordinate = [NSArray arrayWithObjects:[responseObject objectForKey:@"latitude"],[responseObject objectForKey:@"longitude"],[responseObject objectForKey:@"name"], [responseObject objectForKey:@"adresse"], nil];
        [self setCoordinate:coordinate];
        
        //set labels
        self.titleLabel.text = [responseObject objectForKey:@"name"];
        self.temperatureLabel.text = [NSString stringWithFormat:@"Temperature: %@ ℃", [responseObject objectForKey:@"temperature"]];
        self.averageAgeLabel.text = [NSString stringWithFormat:@"Visiter average age: %@", [responseObject objectForKey:@"averageAge"]];
        float malesPercentage = [[responseObject objectForKey:@"malesPercentage"] floatValue] *100;
        self.maleLabel.text = [NSString stringWithFormat:@"%.2f%%", malesPercentage];
        float femalesPercentage = [[responseObject objectForKey:@"femalesPercentage"] floatValue] *100;
        self.femaleLabel.text = [NSString stringWithFormat:@"%.2f%%", femalesPercentage];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [[self.view viewWithTag:10] removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)setCoordinate: (NSArray *)Coor{
    
    double x_double = [[Coor objectAtIndex:0] doubleValue];
    double y_double = [[Coor objectAtIndex:1] doubleValue];
    self.mapView.delegate = self;
    CLLocationCoordinate2D coord = {.latitude =  x_double, .longitude =  y_double};
    MKCoordinateSpan span = {.latitudeDelta =  1, .longitudeDelta =  1};
    MKCoordinateRegion region = {coord, span};
    [self.mapView setRegion:region];
    
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = x_double;
    annotationCoord.longitude = y_double;
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = [Coor objectAtIndex:2];
    annotationPoint.subtitle = [Coor objectAtIndex:3];
    [self.mapView addAnnotation:annotationPoint];
}

- (IBAction)goToGeneralDataVC:(id)sender {

    GeneralDataViewController *generalDataVC= [self.storyboard instantiateViewControllerWithIdentifier:@"GeneralDataVC"];
    [self.navigationController pushViewController:generalDataVC animated:YES];

}
@end
