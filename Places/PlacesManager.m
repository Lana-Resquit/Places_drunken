//
//  PlacesManager.m
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PlacesManager.h"
#import "PlacesBuilder.h"
#import "PlacesCommunicator.h"


@implementation PlacesManager

-(void)fetchPlaces {
    [self.communicator searchPlaces];
}

#pragma mark - PlacesCommunicatorDelegate

-(void)receivedPlacesJSON:(NSData *)objectNotation {

    NSError *error = nil;
    NSArray *places = [PlacesBuilder placesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingPlacesFailedWithError:error];
        
    } else {
        [self.delegate didReceivePlaces:places];
    }

}

-(void)fetchingPlacesFailedWithError:(NSError *)error {
    
    [self.delegate fetchingPlacesFailedWithError:error];
}

@end
