//
//  AKEntryController.h
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKEntry.h"

@interface AKEntryController : NSObject

+ (AKEntryController *)shared;

@property (nonatomic, copy, readonly) NSArray *entries;

- (instancetype)init;

#pragma mark - CRUD functions
- (void)addEntry:(AKEntry *)entry;
- (void)removeEntry:(AKEntry *)entry;
- (void)updateEntry:(AKEntry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText;

@end
