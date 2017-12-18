//
//  AKEntry.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "AKEntry.h"

@implementation AKEntry

- (instancetype) initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [super init];
    
    if (self) {
        _title = [title copy];
        _bodyText = [bodyText copy];
        _timestamp = [NSDate date];
    }
    
    return self;
}

@end
