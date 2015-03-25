//
//  PlacesManager.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlacesCommunicatorDelegate.h"
#import "PlacesManagerDelegate.h"

@class PlacesCommunicator;

@interface PlacesManager : NSObject<PlacesCommunicatorDelegate>

@property (strong, nonatomic) PlacesCommunicator *communicator;
@property (weak, nonatomic) id<PlacesManagerDelegate> delegate;

-(void)fetchPlaces;

@end
