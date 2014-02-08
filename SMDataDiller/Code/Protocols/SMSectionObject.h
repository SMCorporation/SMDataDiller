//
//  SMSectionObject.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 08.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMSectionObject <NSObject>

@required
- (id)itemForRow:(NSUInteger)row;
- (NSUInteger)rowForItem:(id)item;
- (NSUInteger)itemsCount;

@end
