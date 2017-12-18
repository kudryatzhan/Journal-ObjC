//
//  EntrylistTableViewController.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "EntrylistTableViewController.h"
#import "AKEntryController.h"

@interface EntrylistTableViewController ()

@end

@implementation EntrylistTableViewController

- (IBAction)saveEntry:(UIBarButtonItem *)sender {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[AKEntryController shared] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    // Configure the cell...
    AKEntry *entry = [[AKEntryController shared] entries] [indexPath.row];
    
    cell.textLabel.text = [entry title];
    cell.detailTextLabel.text = [entry bodyText];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AKEntry *entry = [[AKEntryController shared] entries] [indexPath.row];
        
        [[AKEntryController shared] removeEntry:entry];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
