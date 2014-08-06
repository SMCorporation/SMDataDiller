//
//  UICollectionViewCell+Size.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 06.08.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "UICollectionViewCell+Size.h"
#import "SMBaseDataSource+PrivateAddons.h"

@implementation UICollectionViewCell (Size)

+ (CGSize)sizeFromXib
{
    static CGSize sizeOfView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIView *view = [SMBaseDataSource loadNibForClass:[self class]]; // make it once, to avoid loading xib everytime, when "+size" will be called
        sizeOfView = view.frame.size;
    });
    
    return sizeOfView;
}

@end

