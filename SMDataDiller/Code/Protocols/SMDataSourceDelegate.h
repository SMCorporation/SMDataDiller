//
//  SMBaseDataSourceDelegate.h
//  SMDataDiller
//
//  Created by Max Kuznetsov on 13.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMBaseDataSource;
@protocol SMDataSourceDelegate <NSObject>

@optional
- (void)dataSource:(SMBaseDataSource *)dataSource didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;
- (void)dataSource:(SMBaseDataSource *)dataSource didDeselectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item DEPRECATED_MSG_ATTRIBUTE("use -dataSource:didSelectRowAtIndexPath:withItem");
- (void)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath withItem:(id)item DEPRECATED_MSG_ATTRIBUTE("use -dataSource:didDeselectRowAtIndexPath:withItem");

@end
