//
//  Paginator.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "Paginator.h"

@interface Paginator()

@property (weak) id<PaginatorDelegate> delegate;
@property (assign) NSInteger pageSize;
@property (assign) NSInteger page;
@property (assign) NSInteger total;
@property (assign) RequestStatus requestStatus;
@property (nonatomic, strong, readwrite) NSMutableArray *results;

@end

@implementation Paginator

- (instancetype)initWithPageSize:(NSInteger)pageSize delegate:(id<PaginatorDelegate>)delegate {
    if (self = [super init]) {
        [self setup];

        self.pageSize = pageSize;
        self.delegate = delegate;
    }

    return self;
}

- (void)setup {
    self.total = 0;
    self.page = 0;
    self.results = [NSMutableArray array];
    self.requestStatus = RequestStatusNone;
}

- (void)reset {
    [self setup];
}

- (BOOL)reachedLastPage {
    static NSInteger total = 0;

    if (self.requestStatus == RequestStatusNone) {
        return NO;
    }

    if (self.total == total) {
        if ([self.delegate respondsToSelector:@selector(paginatorDidReceiveAllResults:)]) {
            [self.delegate paginatorDidReceiveAllResults:self];
        }
        return YES;
    }

    total = self.total;
    return NO;
}

#pragma mark - Fetch

- (void)fetchFirstPage {
    [self reset];

    [self fetchNextPage];
}

- (void)fetchNextPage {
    if (self.requestStatus == RequestStatusInProgress) {
        return;
    }

    if ([self reachedLastPage]) {
        return;
    }

    self.requestStatus = RequestStatusInProgress;
    [self fetchResultsWithPage:self.page+1 pageSize:self.pageSize];
}

#pragma mark - Sublclass methods

- (void)fetchResultsWithPage:(NSInteger)page pageSize:(NSInteger)pageSize {
}

#pragma mark - Results

- (void)receivedResults:(NSArray *)results {
    [self.results addObjectsFromArray:results];
    self.page++;
    self.total += results.count;
    self.requestStatus = RequestStatusDone;

    [self.delegate paginator:self didReceiveResults:results];
}

- (void)failed {
    self.requestStatus = RequestStatusDone;

    if ([self.delegate respondsToSelector:@selector(paginatorDidFailToRespond:)]) {
        [self.delegate paginatorDidFailToRespond:self];
    }
}

@end
