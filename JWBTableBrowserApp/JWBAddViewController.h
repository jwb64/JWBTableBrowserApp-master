//
//  JWBAddViewController.h
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/25/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWBDataModel.h"

@interface JWBAddViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) JWBDataModel *dataModel;
@property (nonatomic, strong) UIAlertView *alertView;

@property (nonatomic, strong) NSString *urlItem;
@property (nonatomic, strong) NSString *nameItem;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

- (IBAction)saveItem:(id)sender;

@end
