//
//  JSONImageResponseService.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "JSONImagesResponseService.h"
#import "ImageResponse.h"

static NSString * const path = @"search/images";

static NSString * const pageKey = @"page";
static NSString * const pageSizeKey = @"page_size";
static NSString * const phraseKey = @"phrase";

@implementation JSONImagesResponseService

- (void)retrieveImagesSuccess:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock {

}

- (void)retrieveImagesWithPage:(NSInteger)page pageSize:(NSInteger)pageSize phrase:(NSString *)phrase success:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@(page) forKey:pageKey];
    [parameters setObject:@(pageSize) forKey:pageSizeKey];
    [parameters setObject:phrase forKey:phraseKey];

    [self request:path parameters:parameters success:^(id responseObject) {
        ImageResponse *response = [[ImageResponse alloc] initWithDictionary:responseObject];
        successBlock(response);

    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

@end
