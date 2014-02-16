//
//  SMCollectionViewCell1.m
//  SMDataDiller
//
//  Created by Max Kuznetsov on 16.02.14.
//  Copyright (c) 2014 SM. All rights reserved.
//

#import "SMCollectionViewCell1.h"

@interface SMCollectionViewCell1 ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation SMCollectionViewCell1

- (void)fillWithObject:(NSString *)domainObject
{
    self.textLabel.text = domainObject;
}

@end
