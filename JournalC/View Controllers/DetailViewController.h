//
//  DetailViewController.h
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AKEntry;

@interface DetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate> 


@property (nonatomic, strong) AKEntry *entry;
- (void)updateWith:(AKEntry *)entry;


@end
