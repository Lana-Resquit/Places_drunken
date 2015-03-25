//
//  MasterViewCellTableViewCell.h
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface MasterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) AFHTTPRequestOperation *loadingPlacesOperation;

@end
