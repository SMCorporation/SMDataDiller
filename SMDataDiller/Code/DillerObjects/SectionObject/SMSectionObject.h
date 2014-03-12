//
//  SMSectionObject.h
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSectionObjectProtocol.h"

@interface SMSectionObject : NSObject <SMSectionObjectProtocol>

- (id)initWithItems:(NSArray *)items;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) id businessObject;

@end
