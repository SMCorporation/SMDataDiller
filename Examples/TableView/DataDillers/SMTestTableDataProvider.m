//
//  SMTestTableDataProvider.m
//  SMDataDiller
//
//  Created by Sergey Pirogov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMTestTableDataProvider.h"

@interface SMTestTableDataProvider ()

@property (nonatomic, strong) NSArray *records;

@end


@implementation SMTestTableDataProvider

- (id)init
{
    self = [super init];
    if (self) {
        self.records = @[@"Title1", @"TItle2", @"TItle3", @"TItle4", @"TItle5"];
    }
    return self;
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)sectionNumber
{
    return self.records.count;
}

- (id)sectionObjectForSection:(NSUInteger)sectionNumber
{
    return self.records;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.records[indexPath.row];
}


@end
