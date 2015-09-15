//
//  UICollectionViewCell+Size.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 06.08.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "UICollectionViewCell+Size.h"
#import "SMBaseDataSource+PrivateAddons.h"

#import <objc/runtime.h>


static NSString *const kSizeKey = @"sm_UICollectionViewCell_size_key";

@implementation UICollectionViewCell (Size)

+ (CGSize)sizeFromXib
{
    CGSize size = CGSizeZero;
    NSValue *sizeValue = objc_getAssociatedObject(self, &kSizeKey);
    
    if (!sizeValue) {
        UIView *view = [SMBaseDataSource loadNibForClass:[self class]];
        size = view.frame.size;
        
        objc_setAssociatedObject(self, &kSizeKey, [NSValue valueWithCGSize:size], OBJC_ASSOCIATION_RETAIN);
    } else {
        size = [sizeValue CGSizeValue];
    }
    
    return size;
}

@end
