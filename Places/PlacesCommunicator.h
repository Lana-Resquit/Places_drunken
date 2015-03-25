//
//  PlacesCommunicator.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlacesCommunicatorDelegate;

@interface PlacesCommunicator : NSObject

@property (weak, nonatomic) id<PlacesCommunicatorDelegate> delegate;

-(void)searchPlaces;

@end
