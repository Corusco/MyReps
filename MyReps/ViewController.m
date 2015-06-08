//
//  ViewController.m
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "RepresentativeController.h"
#import "Representative.h"
#import "DetailViewController.h"

@interface ViewController () <UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self registerForNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self unregisterForNotifications];
}

#pragma mark - Segue Method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cellTapped"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Representative *representativeTappedOn = [RepresentativeController sharedInstance].representatives[indexPath.row];
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.representative = representativeTappedOn;
    }
}

#pragma mark - Table View Datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[RepresentativeController sharedInstance].representatives count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repCell"];
    
    Representative *rep = [RepresentativeController sharedInstance].representatives[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", rep.name, rep.party];
    cell.textLabel.textColor = [rep partyColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", rep.state, rep.district];
    
    return cell;
}

#pragma mark - Search Bar Delegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [[RepresentativeController sharedInstance] searchZipCode:searchBar.text];
}

#pragma mark - Notification Methods

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchComplete) name:kSearchCompleteNotification object:nil];
}

- (void)unregisterForNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)searchComplete
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
