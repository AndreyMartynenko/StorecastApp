//
//  ImageCell.m
//  StorecastApp
//
//  Created by Andrey Martynenko on 10/3/16.
//  Copyright © 2016 Andrey Martynenko. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+AFNetworking.h"
#import "DisplaySize.h"

@interface ImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ImageCell

- (void)prepareForReuse {
    [super prepareForReuse];

    self.thumbnailImageView.image = nil;
}

- (void)setContent:(Image *)image {
    [self.thumbnailImageView setImageWithURL:((DisplaySize *)image.displaySizes[0]).uri];
    self.idLabel.text = image.imageId;
    self.titleLabel.text = image.title;
}

@end
