//
//  SMSectionObject.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMSectionObject.h"

@implementation SMSectionObject

- (id)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}


#pragma mark -
#pragma mark SMSectionObjectProtocol

- (NSUInteger)itemsCount
{
    return [self.items count];
}

- (id)itemForRow:(NSUInteger)row
{
    return self.items[row];
}

- (NSUInteger)rowForItem:(id)item
{
    return [self.items indexOfObject:item];
}

@end
