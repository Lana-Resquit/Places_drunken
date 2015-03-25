//
//  PlacesManagerDelegate.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlacesManagerDelegate

-(void)didReceivePlaces:(NSArray *)places;
-(void)fetchingPlacesFailedWithError:(NSError *)error;

@end