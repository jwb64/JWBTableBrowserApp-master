//
//  JWBDetailViewController.h
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/5/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWBDetailViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *urlContent2;
@property (nonatomic, strong) NSString *urlItem;

-(void)loadURL;


@end
