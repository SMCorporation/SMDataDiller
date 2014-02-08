//
//  SMTestSectionObject.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 08.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMTestSectionObject.h"

@interface SMTestSectionObject ()

@property (nonatomic, strong) NSArray *rows;

@end

@implementation SMTestSectionObject

- (id)initWithRows:(NSArray *)rows
{
    self = [super init];
    if (self) {
        self.rows = rows;
    }
    return self;
}


#pragma mark -
#pragma mark SMSectionObject

- (NSUInteger)itemsCount
{
    return self.rows.count;
}

- (id)itemForRow:(NSUInteger)row
{
    return self.rows[row];
}

- (NSUInteger)rowForItem:(id)item
{
    return [self.rows indexOfObject:item];
}

@end
