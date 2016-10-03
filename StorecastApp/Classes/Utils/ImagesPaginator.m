//
//  ImagesPaginator.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ImagesPaginator.h"
#import "ServicesHub.h"
#import "ImageResponse.h"

@implementation ImagesPaginator

- (void)fetchResultsWithPage:(NSInteger)page pageSize:(NSInteger)pageSize {
    [[ServicesHub sharedInstance].imagesResponseService retrieveImagesWithPage:page pageSize:pageSize phrase:self.searchPhrase success:^(id object) {
        [self receivedResults:((ImageResponse *)object).images];

    } failure:^(NSError *error) {
        [self failed];
    }];
}

@end
