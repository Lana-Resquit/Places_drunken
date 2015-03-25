//
//  DetailViewController.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "AFNetworking.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Place *detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *detailPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailSummary;
@property (strong, nonatomic) AFHTTPRequestOperation *loadingPhotosOperation;


@end

