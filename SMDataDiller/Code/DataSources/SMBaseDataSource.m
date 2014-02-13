//
//  SMBaseDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource.h"
#import "SMBaseDataProvider.h"
#import "SMCell.h"

@implementation SMBaseDataSource

- (id)init
{
    self = [super init];
    if (self) {
        [self initialConfigure];
    }
    return self;
}

- (void)initialConfigure
{
    // there is place for any initial configurations of your dataSource
}

- (void)reload
{
    // need to implement in subclasses
}


#pragma mark -
#pragma mark Data Managment

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *prefix = NSStringFromClass(self.class);
    return [NSString stringWithFormat:@"%@%@", prefix, @"cellReuseIdentefier"];
}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:withItem:)]) {
        id itemObject = [self.dataProvider itemAtIndexPath:indexPath];
        [self.delegate didSelectRowAtIndexPath:indexPath withItem:itemObject];
    }
}

- (void)fillCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(fillWithObject:)]) {
        id domainObject = [self.dataProvider itemAtIndexPath:indexPath];
        [cell performSelector:@selector(fillWithObject:) withObject:domainObject];
    } else {
        NSAssert(nil, @"need to implement in subclasses");
    }
}

@end
