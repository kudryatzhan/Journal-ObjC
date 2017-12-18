//
//  AKEntryController.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "AKEntryController.h"
#import "AKEntry.h"

@interface AKEntryController()

@property (nonatomic, copy, readwrite) NSMutableArray *internalEntries;

@end

@implementation AKEntryController

#pragma mark - Properties
+ (AKEntryController *)shared
{
    static AKEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [AKEntryController new];
    });
    return shared;
}

- (NSArray *)entries
{
    return [self internalEntries];
}

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _internalEntries = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - CRUD Functions
- (void)addEntry:(AKEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntry:(AKEntry *)entry
{
    [self.internalEntries removeObject:entry];
}

@end
