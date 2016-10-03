//
//  BaseObject.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

static NSDateFormatter *baseDateFormatter;

+ (void)initialize {
    if (baseDateFormatter == nil) {
        baseDateFormatter = [[NSDateFormatter alloc] init];
        [baseDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        [self updateFromDictionary:dictionary];
    }
    
    return self;
}

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    
}

@end
