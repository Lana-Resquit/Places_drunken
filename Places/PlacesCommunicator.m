//
//  PlacesCommunicator.m
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PlacesCommunicator.h"
#import "PlacesCommunicatorDelegate.h"
#import "VKSdk.h"

@implementation PlacesCommunicator

-(void)searchPlaces{
    
    NSString *token = [[VKSdk getAccessToken]accessToken];
    NSString *userId = [[VKSdk getAccessToken]userId];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.vk.com/method/photos.getAlbums?user_id=%@&access_token=%@&need_covers=1&photo_sizes=1",userId,token];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingPlacesFailedWithError:error];
        } else {
            [self.delegate receivedPlacesJSON:data];
            
        }
    }];
}


@end
