//
//  SMBaseDataProvider.h
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SMBaseDataProvider : NSObject

@property (nonatomic, copy) NSArray *items;

- (void)initialConfigure;

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;

- (id)sectionObjectForSection:(NSUInteger)section;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)indexPathOfItem:(id)item;

@end
