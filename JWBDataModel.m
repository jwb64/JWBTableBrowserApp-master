//
//  JWBDataModel.m
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/4/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import "JWBDataModel.h"

@implementation JWBDataModel

@synthesize webList;
@synthesize labelList;

+ (id)sharedDataModel {
    static JWBDataModel *sharedDataModel = nil;

    @synchronized(self) {
        if (sharedDataModel == nil) {
            sharedDataModel = [[self alloc] init];
        }
    }

    return sharedDataModel;
}

- (id)init
{
    if (self = [super init])
    {
        webList = [[NSMutableArray alloc] initWithObjects:@"http://www.google.com",@"http://www.amazon.com",@"http://www.yahoo.com",@"http://www.apple.com",@"http://www.facebook.com",nil];
        labelList = [[NSMutableArray alloc] initWithObjects:@"Google",@"Amazon",@"Yahoo",@"Apple",@"Facebook", nil];
    }
    return self;
}

- (NSUInteger)getWebListSize {
    return webList.count;
}

- (NSMutableArray *)getWebList {
    return webList;
}

- (NSMutableArray *)getLabelList {
    return labelList;
}

- (void)addWebsite:(NSString *)url label:(NSString *)name {
    [webList addObject:url];
    [labelList addObject:name];
}

- (void)deleteWebsite:(NSString *)url label:(NSString *)name {
    [webList removeObject:url];
    [labelList removeObject:name];
}

@end
