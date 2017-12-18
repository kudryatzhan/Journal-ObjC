//
//  AKEntry.h
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodyText;
@property (nonatomic, readonly) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

@end
