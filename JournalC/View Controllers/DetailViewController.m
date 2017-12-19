//
//  DetailViewController.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "DetailViewController.h"
#import "AKEntry.h"
#import "AKEntryController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation DetailViewController

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{
    if ([self entry] == nil) {
        AKEntry *newEntry = [[AKEntry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
        [[AKEntryController shared] addEntry: newEntry];
    } else {
        [[AKEntryController shared] updateEntry:[self entry] withTitle:self.titleTextField.text bodyText:self.bodyTextView.text];
    }

    
    [[self navigationController] popViewControllerAnimated:(true)];
}

- (IBAction)clearButtonTapped:(UIButton *)sender
{
    [[self titleTextField] setText:@("")];
    [[self bodyTextView] setText:@("")];
}

- (void)updateWith:(AKEntry *)entry
{
    [[self titleTextField] setText:entry.title];
    [[self bodyTextView] setText:entry.bodyText];
}

#pragma mark UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[self titleTextField] resignFirstResponder];
    return true;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([self entry] == nil) {
        [[self bodyTextView] setText:@""];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self titleTextField] setDelegate:self];
    [[self bodyTextView] setDelegate:self];
    
    
    if ([self entry] != nil) {
        [self updateWith:[self entry]];
        [self setTitle:[self entry].title];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
