//
//  ImageResponseService.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ServicesBlocks.h"

@protocol ImagesResponseService <NSObject>

- (void)retrieveImagesSuccess:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock;
- (void)retrieveImagesWithPage:(NSInteger)page pageSize:(NSInteger)pageSize phrase:(NSString *)phrase success:(SuccessObjectBlock)successBlock failure:(FailureBlock)failureBlock;

@end
