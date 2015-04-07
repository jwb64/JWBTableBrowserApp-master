//
//  JWBViewController.m
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/4/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import "JWBViewController.h"

@interface JWBViewController ()

@end

@implementation JWBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _dataModel = [JWBDataModel sharedDataModel];

    UITableViewController * tableviewcontroller = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableviewcontroller.tableView = self.tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString * urlCellID = @"urlCell";
    
    
    UITableViewCell *urlCell = [tableView dequeueReusableCellWithIdentifier:urlCellID];
    
    if (urlCell == nil) {
        urlCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:urlCellID];
    }
    
    urlCell.textLabel.text = [[_dataModel getLabelList] objectAtIndex:indexPath.row];
    
    return urlCell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"showURL"]) {
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        
        NSString * url = [[_dataModel getWebList] objectAtIndex:row];

        JWBDetailViewController * detailViewController = [segue destinationViewController];
        detailViewController.urlItem = url;
    } else if([[segue identifier] isEqualToString:@"editSegue"]) {
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        NSString *url = [[_dataModel getWebList] objectAtIndex:row];
        NSString *name = [[_dataModel getLabelList] objectAtIndex:row];

        JWBAddViewController *addViewController = [segue destinationViewController];
        addViewController.urlItem = url;
        addViewController.nameItem = name;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataModel getWebListSize];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

    if(_tableView.editing) {
        //We are in editing mode!

        [self performSegueWithIdentifier:@"editSegue" sender:cell];
    } else {


        [self performSegueWithIdentifier:@"showURL" sender:cell];
    }
}

- (IBAction)setEdit:(id)sender {
    if(!_tableView.editing) {
        _editButton.title = @"Done";
        _addButton.enabled = NO;
        [_tableView setEditing:YES animated:YES];
    } else {
        _editButton.title = @"Edit";
        _addButton.enabled = YES;
        [_tableView setEditing:NO animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *website = [[_dataModel getWebList] objectAtIndex:indexPath.row];
        NSString *name = [[_dataModel getLabelList] objectAtIndex:indexPath.row];
        [_dataModel deleteWebsite:website label:name];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
