//
//  SMBaseDataSourceDelegate.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMDataSourceDelegate <NSObject>

@optional
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;
- (void)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;

@end
