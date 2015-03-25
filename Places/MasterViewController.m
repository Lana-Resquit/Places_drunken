//
//  MasterViewController.m
//  Places
//
//  Created by Kristy on 11.03.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MasterTableViewCell.h"

#import "Place.h"
#import "PlacesManager.h"
#import "PlacesCommunicator.h"
#import "AFNetworking.h"
#import "VKSdk.h"

@interface MasterViewController () <PlacesManagerDelegate,UIScrollViewDelegate> {
    NSArray *_places;
    PlacesManager *_manager;
}

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _manager = [[PlacesManager alloc]init];
    _manager.communicator = [[PlacesCommunicator alloc]init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchPlaces];
}

-(void)didReceivePlaces:(NSArray *)places {
    _places = places;
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)fetchingPlacesFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Place *place = _places[indexPath.row];
        [[segue destinationViewController] setDetailItem:place];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    MasterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Place *place = _places[indexPath.row];
    cell.summary.text = place.placeSummary;
    cell.title.text = place.placeTitle;
    
    NSURL *url = [NSURL URLWithString:place.urlPhoto];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        cell.photo.image = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
    }];
    [cell setLoadingPlacesOperation:requestOperation];
    [requestOperation start];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
