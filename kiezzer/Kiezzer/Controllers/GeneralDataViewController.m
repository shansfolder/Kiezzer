//
//  GeneralDataViewController.m
//  Kiezzer
//
//  Created by He Yongfeng on 13-10-26.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "GeneralDataViewController.h"
#import "ActivityIndicatorViewController.h"

@interface GeneralDataViewController ()

@end

@implementation GeneralDataViewController{
    NSArray * dataarray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



/*
 Return an array with
 [generalGirlsPct, generalAge, generalTemperature]
 */
- (NSArray *)getGerneralInfo
{
    
    int size = [dataarray count];
    NSLog(@"%d",size);
    float pct = 0;
    float age = 0;
    float tmp = 0;
    for (int i=0; i<size; i++)
    {
        NSString* pctstr = [[dataarray objectAtIndex:i] objectForKey:@"femalesPercentage" ];
        NSString* agestr = [[dataarray objectAtIndex:i] objectForKey:@"averageAge" ];
        NSString* tmpstr = [[dataarray objectAtIndex:i] objectForKey:@"temperature" ];
        pct += [pctstr floatValue];
        age += [agestr floatValue];
        tmp += [tmpstr floatValue];
    }
    pct = pct/size;
    age = age/size;
    tmp = tmp/size;
    //NSLog(@"%f, %f, %f", pct,age,tmp);
    
    NSArray * generalInfo = [NSArray arrayWithObjects:
                             [NSNumber numberWithFloat:pct],
                             [NSNumber numberWithFloat:age],
                             [NSNumber numberWithFloat:tmp],
                             nil];
    return generalInfo;
    
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    //get json here
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://data.kiezzer.com/alldata/74bbf3bedbbb1050e90503a6cf54705e"]];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    NSArray *response=[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    
    dataarray = [[NSArray alloc] init];
    dataarray = response;
    
    //NSLog(@"%@", dataarray);
    
	NSArray* allInfo = [self getGerneralInfo]; //get general average data
    NSLog(@"%@", allInfo);
    float pct = [[allInfo objectAtIndex:0] floatValue];  //girl percentage
    float age= [[allInfo objectAtIndex:1] floatValue];   //age
    float tmp = [[allInfo objectAtIndex:2] floatValue];  //temperature
    NSString *stringAge = [NSString stringWithFormat:@"%.2f",age];
    NSString *stringTmp = [NSString stringWithFormat:@"%.0f",tmp];
    NSString *stringPct = [NSString stringWithFormat:@"%.2f",pct*100];
    NSString *stringPctMale = [NSString stringWithFormat:@"%.2f",(1-pct)*100];
    
    self.girlsPctLabel.text =[NSString stringWithFormat:@"%@%%", stringPct];
    self.maleLabel.text = [NSString stringWithFormat:@"%@%%", stringPctMale];
    self.ageLabel.text =[NSString stringWithFormat:@"%@%@", @"Overall Age: ",stringAge];
    self.temperatureLabel.text =[NSString stringWithFormat:@"Overall Temperature: %@°C", stringTmp];
    /*
    CGFloat widthScale = pct;
    CGFloat heightScale = 1;
    self.redTab.image.size.width = 100
    self.redTab.image = [self adjustImageSizeWhenCropping:self.redTab.image with:pct];
     */
    
    
    
}

/*
-(UIImage *)adjustImageSizeWhenCropping: (UIImage *)image with: (float) pct
{
    
    int actualHeight = image.size.height;
    int actualWidth = image.size.width;
    
    float ratio=300/actualWidth;
    actualHeight = actualHeight*ratio;
    
    CGRect rect = CGRectMake(0.0, 0.0, (actualWidth * pct), actualHeight);
    // UIGraphicsBeginImageContext(rect.size);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
    
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
