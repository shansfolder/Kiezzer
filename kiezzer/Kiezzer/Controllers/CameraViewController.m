//
//  CameraViewController.m
//  Kiezzer
//
//  Created by Penergy on 13-10-27.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "CameraViewController.h"
#import "ViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController


- (IBAction)takePhoto:(id)sender {
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)chooseExisting:(id)sender {
    NSLog(@"exit!!!");
    //ViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
    //[self.navigationController pushViewController:mainVC animated:YES];
    
    picker2 = [[UIImagePickerController alloc] init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:YES completion:NULL];
    
}

- (IBAction)uploading:(id)sender {
}



- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage:image];
    [self dismissViewControllerAnimated:YES
                             completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES
                            completion:NULL];
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
