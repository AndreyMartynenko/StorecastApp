//
//  ServicesBlocks.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^RequestSuccessBlock)(id responseObject);
typedef void (^SuccessArrayBlock)(NSArray *results);
typedef void (^SuccessObjectBlock)(id object);
typedef void (^SuccessBlock)();
typedef void (^FailureBlock)(NSError* error);

