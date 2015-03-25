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

-(void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.photo.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.photo.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.photo.frame = imageRect;
    
}

@end
