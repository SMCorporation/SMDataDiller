//
//  UITableViewCell+Size.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 06.08.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "UITableViewCell+Size.h"
#import "SMBaseDataSource+PrivateAddons.h"

#import <objc/runtime.h>


static NSString *const kSizeKey = @"sm_UITableViewCell_size_key";
static NSString *const kReuseIdentifierKey = @"sm_reuse_identifier_ket";


@implementation UITableViewCell (Size)

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(reuseIdentifier)),
                                   class_getInstanceMethod(self, @selector(smReuseIdentifier)));
}

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

- (void)setCellReuseIdentifier:(NSString *)identifier
{
    objc_setAssociatedObject(self, &kReuseIdentifierKey, identifier, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)smReuseIdentifier
{
    NSString *ident = objc_getAssociatedObject(self, &kReuseIdentifierKey);
    if (!ident.length) {
        ident = [self smReuseIdentifier];
    }
    
    return ident;
}

@end
