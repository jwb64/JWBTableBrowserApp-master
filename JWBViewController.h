//
//  JWBViewController.h
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/4/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWBDetailViewController.h"
#import "JWBDataModel.h"
#import "JWBAddViewController.h"

@interface JWBViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
- (IBAction)setEdit:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (nonatomic, strong) JWBDataModel *dataModel;

@end
