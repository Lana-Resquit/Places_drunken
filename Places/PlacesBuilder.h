//
//  PlacesBuilder.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlacesBuilder : NSObject

+(NSArray *)placesFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
