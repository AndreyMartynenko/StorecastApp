//
//  ImageResponse.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ImageResponse.h"

@implementation ImageResponse

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];

    if (dictionary[@"images"]) {
        self.images = dictionary[@"images"];

        NSMutableArray *images = [NSMutableArray array];
        for (NSDictionary *image in self.images)
            [images addObject:[[Image alloc] initWithDictionary:image]];
        self.images = [images copy];
    }
    if (dictionary[@"result_count"]) {
        self.resultCount = [dictionary[@"result_count"] integerValue];
    }
}

@end
