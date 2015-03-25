//
//  MasterViewCellTableViewCell.m
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "MasterTableViewCell.h"

@implementation MasterTableViewCell

-(void)prepareForReuse {
    [super prepareForReuse];
    
    self.summary.text = nil;
    self.photo.image = nil;
    self.title.text = nil;
    [self.loadingPlacesOperation cancel];
}

@end
