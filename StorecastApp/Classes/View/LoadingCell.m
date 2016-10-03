//
//  LoadingCell.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "LoadingCell.h"

@interface LoadingCell ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation LoadingCell

- (void)prepareForReuse {
    [super prepareForReuse];

    [self.spinner stopAnimating];
}

- (void)updateContent {
    [self.spinner startAnimating];
}

@end
