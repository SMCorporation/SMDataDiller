//
//  SMBaseCoreDataProvider.h
//  SMDataDiller
//
//  Created by Sergey Pirogov on 12.03.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMBaseDataProvider.h"
#import <CoreData/CoreData.h>

@class SMBaseCoreDataProvider;
@protocol SMCoreDataProviderDelegate <NSObject>

@optional
- (void)dataProvider:(SMBaseCoreDataProvider*)dataProvider didUpdatedContent:(NSArray *)newContent;

@end


@interface SMBaseCoreDataProvider : SMBaseDataProvider

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedOjectContext;
@property (nonatomic, strong, readonly) NSString *sectionNameKeyPath;
@property (nonatomic, strong, readonly) NSString *cacheName;
@property (nonatomic, strong) NSFetchRequest *fetchRequest;

@property (nonatomic, weak) id<SMCoreDataProviderDelegate> delegate;

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedOjectContext; //use this INSTEAD simple "init"
- (void)save;
- (void)reload;

@end
