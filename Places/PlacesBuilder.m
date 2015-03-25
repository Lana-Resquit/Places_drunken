//
//  PlacesBuilder.m
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PlacesBuilder.h"
#import "Place.h"
#import "VKSdk.h"

@implementation PlacesBuilder

+(NSArray *)placesFromJSON:(NSData *)objectNotation error:(NSError *__autoreleasing *)error {
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *places = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject objectForKey:@"response"];
    
    for (NSDictionary *albumDic in results ) {
        Place *myPlace = [[Place alloc]init];
        
        [myPlace setPlaceSummary:[albumDic objectForKey:@"description"]];
        [myPlace setPlaceTitle:[albumDic objectForKey:@"title"]];
        
        NSArray *photoResults = [albumDic objectForKey:@"sizes"];
        
        
        for (NSDictionary *photoDic in photoResults) {
            NSString *urlPhoto = [photoDic objectForKey:@"src"];
            
            [myPlace setUrlPhoto:urlPhoto];
        }
        
        
        [places addObject:myPlace];
    }
    return places;

}

@end
