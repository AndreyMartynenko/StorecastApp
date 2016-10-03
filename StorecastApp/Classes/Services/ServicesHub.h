//
//  ServicesHub.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImagesResponseService.h"

@interface ServicesHub : NSObject

+ (ServicesHub *)sharedInstance;

- (NSObject <ImagesResponseService> *)imagesResponseService;

@end
