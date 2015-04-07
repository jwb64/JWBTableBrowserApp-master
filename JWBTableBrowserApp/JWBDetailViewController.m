//
//  JWBDetailViewController.m
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/5/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import "JWBDetailViewController.h"

@implementation JWBDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self loadURL];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadURL{
    
    NSURL *url = [NSURL URLWithString:_urlItem];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [_urlContent2 loadRequest:request];

}

@end
