//
//  DetailViewController.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "DetailViewController.h"
#import "AKEntry.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;


@end

@implementation DetailViewController

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender
{

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



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
