//
//  Paginator.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Based on NMPaginator: https://github.com/nmondollot/NMPaginator
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaginatorDelegate.h"

typedef enum {
    RequestStatusNone,
    RequestStatusInProgress,
    RequestStatusDone
} RequestStatus;

@interface Paginator : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *results;

- (instancetype)initWithPageSize:(NSInteger)pageSize delegate:(id<PaginatorDelegate>)delegate;

- (void)reset;

- (void)fetchFirstPage;
- (void)fetchNextPage;

- (void)receivedResults:(NSArray *)results;
- (void)failed;

@end
