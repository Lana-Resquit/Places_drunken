
//
//  Header.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlacesCommunicatorDelegate

-(void)receivedPlacesJSON:(NSData *)objectNotation;
-(void)fetchingPlacesFailedWithError:(NSError *)error;

@end
