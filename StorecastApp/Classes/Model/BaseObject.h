//
//  BaseObject.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BaseObject : NSObject

@property (nonatomic, assign) NSInteger identifier;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)updateFromDictionary:(NSDictionary *)dictionary;

@end
