//
//  Image.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "Image.h"

@implementation Image

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];

    if (dictionary[@"asset_family"]) {
        self.assetFamily = dictionary[@"asset_family"];
    }
    if (dictionary[@"caption"]) {
        if (dictionary[@"caption"] == [NSNull null]) {
            self.caption = @"";
        } else {
            self.caption = dictionary[@"caption"];
        }
    }
    if (dictionary[@"collection_code"]) {
        self.collectionCode = dictionary[@"collection_code"];
    }
    if (dictionary[@"collection_id"]) {
        self.collectionId = dictionary[@"collection_id"];
    }
    if (dictionary[@"collection_name"]) {
        self.collectionName = dictionary[@"collection_name"];
    }
    if (dictionary[@"display_sizes"]) {
        self.displaySizes = dictionary[@"display_sizes"];

        NSMutableArray *displaySizes = [NSMutableArray array];
        for (NSDictionary *displaySize in self.displaySizes)
            [displaySizes addObject:[[DisplaySize alloc] initWithDictionary:displaySize]];
        self.displaySizes = [displaySizes copy];

    }
    if (dictionary[@"id"]) {
        self.imageId = dictionary[@"id"];
    }
    if (dictionary[@"license_model"]) {
        self.licenseModel = dictionary[@"license_model"];
    }
    if (dictionary[@"max_dimensions"]) {
        self.maxDimension = [[Dimension alloc] initWithDictionary:dictionary[@"max_dimensions"]];
    }
    if (dictionary[@"title"]) {
        self.title = dictionary[@"title"];
    }
}

@end
