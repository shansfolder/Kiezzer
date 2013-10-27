//
//  FotosTableViewCell.m
//  Kiezzer
//
//  Created by Penergy on 13-10-26.
//  Copyright (c) 2013年 com.Kiezzer. All rights reserved.
//

#import "FotosTableViewCell.h"

@implementation FotosTableViewCell

@synthesize clubNameLabel;
@synthesize cellBkImage;
@synthesize cellWhiteBkImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
