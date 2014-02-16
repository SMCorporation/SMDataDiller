//
//  SMBaseDataSource.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataSource.h"
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
    self.shouldAutoDeselectCells = YES;
    
    // there is place for any initial configurations of your dataSource
}

- (void)reload
{
    // need to implement in subclasses
}


#pragma mark -
#pragma mark Data Managment

- (Class)classForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return Nil;
}

- (NSString *)cellReuseIdentifierAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *prefix = NSStringFromClass(self.class);
    return [NSString stringWithFormat:@"%@%@", prefix, @"CellReuseIdentefier"];
}

- (void)setupCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
    //any things to setup cell (called once)
}

- (void)fillCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(fillWithObject:)]) {
        id domainObject = [self.dataProvider itemAtIndexPath:indexPath];
        [cell performSelector:@selector(fillWithObject:) withObject:domainObject];
    }
}

- (void)didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:withItem:)]) {
        id itemObject = [self.dataProvider itemAtIndexPath:indexPath];
        [self.delegate didSelectRowAtIndexPath:indexPath withItem:itemObject];
    }
}

@end
