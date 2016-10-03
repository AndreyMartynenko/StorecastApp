//
//  ImageResponse.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "BaseObject.h"
#import "Image.h"

@interface ImageResponse : BaseObject

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) NSInteger resultCount;

@end
