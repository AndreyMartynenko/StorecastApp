//
//  Dimension.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "Dimension.h"

@implementation Dimension

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];

    if (dictionary[@"height"]) {
        self.height = [dictionary[@"height"] floatValue];
    }
    if (dictionary[@"width"]) {
        self.width = [dictionary[@"width"] floatValue];
    }
}

@end
