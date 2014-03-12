//
//  SMSectionObjectProtocol.h
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMSectionObjectProtocol <NSObject>

- (NSUInteger)itemsCount;
- (id)itemForRow:(NSUInteger)row;
- (NSUInteger)rowForItem:(id)item;

@end
