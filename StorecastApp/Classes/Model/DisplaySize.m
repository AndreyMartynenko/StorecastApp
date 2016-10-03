//
//  DisplaySize.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "DisplaySize.h"

@implementation DisplaySize

- (void)updateFromDictionary:(NSDictionary *)dictionary {
    [super updateFromDictionary:dictionary];

    if (dictionary[@"is_watermarked"]) {
        self.isWatermarked = [dictionary[@"is_watermarked"] integerValue] == 0 ? NO : YES;
    }
    if (dictionary[@"name"]) {
        self.name = dictionary[@"name"];
    }
    if (dictionary[@"uri"]) {
        NSString *uri = [dictionary[@"uri"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        self.uri = [NSURL URLWithString:uri];
    }
}

@end
