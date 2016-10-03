//
//  ServicesHub.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ServicesHub.h"

#import "JSONImagesResponseService.h"

@interface ServicesHub()

@property (nonatomic, strong) NSObject <ImagesResponseService> *imagesResponseService;

@end

@implementation ServicesHub

static ServicesHub *sharedInstance;

+ (void)initialize {
    if (sharedInstance == nil) {
        sharedInstance = [ServicesHub new];
        
        sharedInstance.imagesResponseService = [JSONImagesResponseService new];
    }
}

+ (ServicesHub *)sharedInstance {
    return sharedInstance;
}

@end
