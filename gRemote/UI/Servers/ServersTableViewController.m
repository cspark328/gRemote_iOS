//
//  ServersTableViewController.m
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ServersTableViewController.h"

@implementation ServersTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self setTitle:@"Server List"];
            
            _refreshButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(didClickRefreshButton:)];
            [self.navigationItem setLeftBarButtonItem:_refreshButtonItem animated:YES];
            
            _closeButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didClickCloseButton:)];
            [self.navigationItem setRightBarButtonItem:_closeButtonItem animated:YES];
        }
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Button Action

- (void)didClickCloseButton:(UIButton *)button
{
    NSLog(@"didClickCloseButton");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickRefreshButton:(UIButton *)button
{
    NSLog(@"didClickRefreshButton");
}

@end
