//
//  CameraViewController.h
//  Kiezzer
//
//  Created by Penergy on 13-10-27.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;
    IBOutlet UIImageView *imageView;
    
}
- (IBAction)takePhoto:(id)sender;
- (IBAction)chooseExisting:(id)sender;
- (IBAction)uploading:(id)sender;




@end
