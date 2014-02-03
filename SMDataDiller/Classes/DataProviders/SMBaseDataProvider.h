//
//  SMBaseDataProvider.h
//  Serg And Max
//
//  Created by SM on 01.02.14.
//  Copyright (c) 2014 SP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBaseDataProvider : NSObject

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)sectionNumber;

- (id)sectionObjectForSection:(NSUInteger)sectionNumber;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
