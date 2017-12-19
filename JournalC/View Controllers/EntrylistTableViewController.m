//
//  EntrylistTableViewController.m
//  JournalC
//
//  Created by Kudryatzhan Arziyev on 12/18/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

#import "EntrylistTableViewController.h"
#import "AKEntryController.h"
#import "DetailViewController.h"

@interface EntrylistTableViewController ()

//NSDateFormatter *formatter = 

@end

@implementation EntrylistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEditEntry"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        AKEntry *entry = [AKEntryController shared].entries [indexPath.row];
        DetailViewController *destinationVC = [segue destinationViewController];
        [destinationVC setEntry:entry];
    }
}


@end
