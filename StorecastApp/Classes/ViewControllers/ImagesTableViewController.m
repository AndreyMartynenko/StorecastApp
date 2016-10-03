//
//  ImagesTableViewController.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "ServicesHub.h"
#import "ImageResponse.h"
#import "ImageCell.h"
#import "LoadingCell.h"
#import "UIImageView+AFNetworking.h"

static NSString * const imageCellIdentifier = @"ImageCellIdentifier";
static NSString * const loadingCellIdentifier = @"LoadingCellIdentifier";

@interface ImagesTableViewController ()

@property (nonatomic, strong) ImagesPaginator *paginator;
@property (nonatomic, assign) BOOL shouldShowLoadingCell;

@end

@implementation ImagesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Images";
    self.tableView.tableFooterView = [UIView new];

    // Add refresh control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    refreshControl.backgroundColor = [UIColor lightGrayColor];
    refreshControl.tintColor = [UIColor whiteColor];
    [refreshControl addTarget:self action:@selector(updateData) forControlEvents:UIControlEventValueChanged];

    self.refreshControl = refreshControl;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // Set title to refresh control
    NSString *title = @"Fetching images...";
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                forKey:NSForegroundColorAttributeName];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];

    // Update table view's content
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentOffset.y - self.refreshControl.frame.size.height) animated:YES];

    // Paginator
    self.paginator = [[ImagesPaginator alloc] initWithPageSize:10 delegate:self];
    self.paginator.searchPhrase = @"mobile";

    [self.paginator fetchFirstPage];
}

- (void)updateData {
    [self.paginator fetchNextPage];
}

#pragma mark - Table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shouldShowLoadingCell ? self.paginator.results.count + 1 : self.paginator.results.count ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.paginator.results.count) {
        return 44;
    } else {
        return 88;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];

    if (indexPath.row == self.paginator.results.count) {
        cell = [tableView dequeueReusableCellWithIdentifier:loadingCellIdentifier forIndexPath:indexPath];
        [(LoadingCell *)cell updateContent];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:imageCellIdentifier forIndexPath:indexPath];
        [(ImageCell *)cell setContent:self.paginator.results[indexPath.row]];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.paginator.results.count) {
        return;
    }

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Caption"
                                                                   message:((Image *)self.paginator.results[indexPath.row]).caption
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y == scrollView.contentSize.height - CGRectGetHeight(scrollView.bounds)) {
        [self updateData];
    }
}

#pragma mark - UIRefreshControl

- (void)updateRefreshControlWithTitle:(NSString *)title {
    if (self.refreshControl) {
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor whiteColor]
                                                                    forKey:NSForegroundColorAttributeName];
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];

        [self.refreshControl endRefreshing];
    }
}

- (void)updateRefreshControlWithTimestamp {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"MMM d, h:mm a"];
    [self updateRefreshControlWithTitle:[NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]]];
}

#pragma mark - Paginator delegate methods

- (void)paginator:(Paginator *)paginator didReceiveResults:(NSArray *)results {
    NSLog(@"__didReceiveResults:");
    self.shouldShowLoadingCell = YES;
    [self.tableView reloadData];
    [self updateRefreshControlWithTimestamp];
}

- (void)paginatorDidReceiveAllResults:(Paginator *)paginator {
    NSLog(@"__didReceiveAllResults:");
    self.shouldShowLoadingCell = NO;
    [self.tableView reloadData];
    [self updateRefreshControlWithTimestamp];
}

- (void)paginatorDidFailToRespond:(Paginator *)paginator {
    NSLog(@"__didFailToRespond:");
    [self.paginator reset];
    self.shouldShowLoadingCell = NO;
    [self.tableView reloadData];
    [self updateRefreshControlWithTimestamp];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"No data"
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
