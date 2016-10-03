//
//  DisplaySize.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "BaseObject.h"

@interface DisplaySize : BaseObject

@property (nonatomic, assign) BOOL isWatermarked;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSURL *uri;

@end
