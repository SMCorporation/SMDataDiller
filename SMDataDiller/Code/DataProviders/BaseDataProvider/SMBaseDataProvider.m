//
//  SMBaseDataProvider.m
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import "SMBaseDataProvider.h"
#import "SMSectionObjectProtocol.h"

@implementation SMBaseDataProvider

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
    // there is place for any initial configurations of your dataProvider
}

- (void)reload
{
    // there is place for logic of re creating items
}


#pragma mark -
#pragma mark Content Managment

- (NSUInteger)numberOfSections
{
    if ([self hasSections]) {
        return [self.items count];
    }
    return 1;
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)section
{
    if ([self hasSections]) {
        id sectionObject = self.items[section];
        if ([self isSectionObject:sectionObject]) {
            return [sectionObject itemsCount];
        }
        return [sectionObject count];
    }
    return self.items.count;
}

- (id)sectionObjectForSection:(NSUInteger)section
{
    if ([self hasSections]) {
        return (section < self.items.count) ? self.items[section] : nil;
    }
    return self.items;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self hasSections]) {
        id item = self.items[indexPath.section];
        if ([self isSectionObject:item]) {
            return [item itemForRow:indexPath.row];
        }
        return item[indexPath.row];
    }
    return (indexPath.section) ? nil : self.items[indexPath.row];;
}

- (NSIndexPath *)indexPathOfItem:(id)item
{
    NSIndexPath *itemIndexPath = [self indexPathForItem:item inItems:self.items withSetionIndex:0];
    if ([self hasSections]) {
        for (int sectionIndex = 0; sectionIndex < self.items.count; sectionIndex++) {
            NSArray *sectionItems = self.items[sectionIndex];
            NSIndexPath *indexPath = [self indexPathForItem:item inItems:sectionItems withSetionIndex:sectionIndex];
            if (indexPath) {
                itemIndexPath = indexPath;
                break;
            }
        }
    }
    return itemIndexPath;
}


#pragma mark -
#pragma mark Help Methods

- (BOOL)hasSections
{
    if (self.items.count) {
        id item = [self.items firstObject];
        if ([item isKindOfClass:[NSArray class]] || [self isSectionObject:item]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isSectionObject:(id)object
{
    return [[object class] conformsToProtocol:@protocol(SMSectionObjectProtocol)];
}

- (NSIndexPath *)indexPathForItem:(id)item inItems:(id)items withSetionIndex:(NSUInteger)sectionIndex
{
    if ([items isKindOfClass:[NSArray class]]) {
        NSArray *arrItems = (NSArray *)items;
        for (int itemIndex = 0; itemIndex < arrItems.count; itemIndex++) {
            id sectionItem = arrItems[itemIndex];
            if (sectionItem == item) {
                return [NSIndexPath indexPathForRow:itemIndex inSection:sectionIndex];
            }
        }
    } else if ([self isSectionObject:items]) {
        id<SMSectionObjectProtocol> sectionObject = items;
        NSUInteger itemIndex = [sectionObject rowForItem:item];
        if (itemIndex != NSNotFound) {
            return [NSIndexPath indexPathForRow:itemIndex inSection:sectionIndex];
        }
    }
    return nil;
}

@end
