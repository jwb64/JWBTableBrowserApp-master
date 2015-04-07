//
//  JWBAddViewController.m
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/25/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import "JWBAddViewController.h"

@implementation JWBAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataModel = [JWBDataModel sharedDataModel];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //Should resign both no matter what
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)saveItem:(id)sender {
    //Check if nonempty
    if(![_urlTextField.text  isEqual: @""] && ![_nameTextField.text  isEqual: @""]) {
        if(_urlItem == nil && _nameItem == nil) {
            //We got here by +
            [_dataModel addWebsite:_urlTextField.text label:_nameTextField.text];
        } else {
            //We got here by edit
            NSUInteger webIndex = [[_dataModel getWebList] indexOfObject:_urlItem];
            NSUInteger nameIndex = [[_dataModel getLabelList] indexOfObject:_nameItem];
            [[_dataModel getWebList] replaceObjectAtIndex:webIndex withObject:_urlTextField.text];
            [[_dataModel getLabelList] replaceObjectAtIndex:nameIndex withObject:_nameTextField.text];
        }

    } else {
        //Failed
    }
}
@end
