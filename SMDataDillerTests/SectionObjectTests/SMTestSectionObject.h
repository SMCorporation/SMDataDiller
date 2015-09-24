//
//  SMTestSectionObject.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 08.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSectionObject.h"

@interface SMTestSectionObject : NSObject <SMSectionObjectProtocol>

- (id)initWithRows:(NSArray *)rows;

@end
