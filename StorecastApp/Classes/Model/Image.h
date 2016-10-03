//
//  Image.h
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "BaseObject.h"
#import "DisplaySize.h"
#import "Dimension.h"

@interface Image : BaseObject

@property (nonatomic, strong) NSString *assetFamily;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *collectionCode;
@property (nonatomic, strong) NSString *collectionId;
@property (nonatomic, strong) NSString *collectionName;
@property (nonatomic, strong) NSArray *displaySizes;
@property (nonatomic, strong) NSString *imageId;
@property (nonatomic, strong) NSString *licenseModel;
@property (nonatomic, strong) Dimension *maxDimension;
@property (nonatomic, strong) NSString *title;

@end
