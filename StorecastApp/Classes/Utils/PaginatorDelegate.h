//
//  PaginatorDelegate.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Paginator;

@protocol PaginatorDelegate <NSObject>

@required
- (void)paginator:(Paginator *)paginator didReceiveResults:(NSArray *)results;

@optional
- (void)paginatorDidFailToRespond:(Paginator *)paginator;
- (void)paginatorDidReceiveAllResults:(Paginator *)paginator;

@end
