//
//  SMCell.h
//  SMDataDiller
//
//  Created by Sergey Pirogov on 03.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMCell <NSObject>

- (void)fillWithObject:(id)domainObject;

@end
