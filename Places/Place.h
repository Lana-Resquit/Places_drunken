//
//  Place.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property (nonatomic, copy) NSString *placeSummary;
@property (nonatomic, copy) NSString *placeTitle;
@property (nonatomic, copy) NSString *urlPhoto;
@property (nonatomic, strong) NSString *albumId;

@end
