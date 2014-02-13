//
//  SMSectionObjectTests.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 08.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMBaseDataProvider.h"
#import "SMTestSectionObject.h"

static NSUInteger const kRowsCount = 7;
static NSUInteger const kSectionsCount = 5;

@interface SMSectionObjectTests : XCTestCase

@property (nonatomic, strong) SMBaseDataProvider *dataProvider;

@end

@implementation SMSectionObjectTests

- (void)setUp
{
    [super setUp];

    NSMutableArray *items = [NSMutableArray new];
    for (int i = 0; i < kRowsCount * kSectionsCount; i += kRowsCount) {
        SMTestSectionObject *sectionObject = [self testSectionObjectAtIndex:i];
        [items addObject:sectionObject];
    }
 
    self.dataProvider = [[SMBaseDataProvider alloc] init];
    [self.dataProvider setItems:items];
}

- (SMTestSectionObject *)testSectionObjectAtIndex:(NSUInteger)index
{
    NSMutableArray *items = [NSMutableArray new];
    for (NSUInteger i = index; i < index + kRowsCount; i ++) {
        NSString *item = [NSString stringWithFormat:@"item%lu", (unsigned long)i];
        [items addObject:item];
    }
    return [[SMTestSectionObject alloc] initWithRows:items];
}

- (void)tearDown
{
    self.dataProvider = nil;
    [super tearDown];
}

- (void)testSectionItem
{
    NSUInteger sectionsNumber = [self.dataProvider numberOfSections];
    XCTAssertTrue(sectionsNumber == kSectionsCount, @"sectionsNumber should be equal 7");
    
    NSUInteger rowsNumber = [self.dataProvider numberOfItemsInSection:1];
    XCTAssertTrue(rowsNumber == kRowsCount, @"rowsNumber should be equal 7");
}

- (void)testIndexOfItem
{
    NSIndexPath *itemIndexPath = [NSIndexPath indexPathForRow:3 inSection:2];
    NSString *item = [self.dataProvider itemAtIndexPath:itemIndexPath];
    NSIndexPath *index = [self.dataProvider indexPathOfItem:item];
    
    XCTAssertNotNil(index, @"index should not be nil");
}

@end
