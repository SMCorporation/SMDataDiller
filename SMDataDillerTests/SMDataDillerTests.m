//
//  SMDataDillerTests.m
//  SMDataDillerTests
//
//  Created by Max Kuznetsov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMBaseDataProvider.h"


@interface SMDataDillerTests : XCTestCase

@property (nonatomic, strong) SMBaseDataProvider *dataProvider;

@end

@implementation SMDataDillerTests

- (void)setUp
{
    [super setUp];
    self.dataProvider = [[SMBaseDataProvider alloc] init];
    [self.dataProvider setItems:@[@"Title1", @"TItle2", @"TItle3", @"TItle4", @"TItle5"]];
}

- (void)tearDown
{
    self.dataProvider = nil;
    [super tearDown];
}

- (void)testItemAtIndexPath
{
    NSString *item1 = [self.dataProvider itemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    XCTAssertNotNil(item1, @"item1 should not be nil");
    
    NSString *item2 = [self.dataProvider itemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    XCTAssertNil(item2, @"item 2 should be nil");
    
    NSIndexPath *inexOfItem2 = [self.dataProvider indexPathOfItem:item2];
    XCTAssertNil(inexOfItem2, @"inexOfItem2 should be nil");
    
    NSIndexPath *indexOfItem1 = [self.dataProvider indexPathOfItem:item1];
    XCTAssertNotNil(indexOfItem1, @"indexOfItem1 should not be nil");
    
    XCTAssertTrue([indexOfItem1 isEqual:[NSIndexPath indexPathForRow:2 inSection:0]], @"indexOfItem1, row should equal 2, section 0");
}

@end


