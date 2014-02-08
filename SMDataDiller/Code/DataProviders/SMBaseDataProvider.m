//
//  SMBaseDataProvider.m
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import "SMBaseDataProvider.h"
#import "SMSectionObject.h"

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
    
}

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

- (NSUInteger)numberOfSections
{
    if ([self hasSections]) {
        return [self.items count];
    }
    return 1;
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)sectionNumber
{
    if ([self hasSections]) {
        id sectionItem = self.items[sectionNumber];
        if ([self isSectionObject:sectionItem]) {
            return [sectionItem itemsCount];
        }
        return [sectionItem count];
    }
    return self.items.count;
}

- (id)sectionObjectForSection:(NSUInteger)sectionNumber
{
    if ([self hasSections]) {
        return (sectionNumber < self.items.count) ? self.items[sectionNumber] : nil;
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
    id item = (indexPath.section) ? nil : self.items[indexPath.row];
    return item;
}

- (NSIndexPath *)indexPathOfItem:(id)item
{
    NSIndexPath *itemIndexPath = [self indexPathForItem:item fromItems:self.items withSetionIndex:0];
    if ([self hasSections]) {
        for (int sectionIndex = 0; sectionIndex < self.items.count; sectionIndex++) {
            NSArray *sectionItems = self.items[sectionIndex];
            NSIndexPath *indexPath = [self indexPathForItem:item fromItems:sectionItems withSetionIndex:sectionIndex];
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

- (NSIndexPath *)indexPathForItem:(id)item fromItems:(id)items withSetionIndex:(NSUInteger)sectionIndex
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
        id<SMSectionObject> sectionObject = items;
        NSUInteger itemIndex = [sectionObject rowForItem:item];
        if (itemIndex != NSNotFound) {
            return [NSIndexPath indexPathForRow:itemIndex inSection:sectionIndex];
        }
    }
    return nil;
}

- (BOOL)isSectionObject:(id)object
{
    return [[object class] conformsToProtocol:@protocol(SMSectionObject)];
}

@end
