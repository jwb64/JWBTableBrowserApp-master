//
//  JWBDataModel.h
//  JWBTableBrowserApp
//
//  Created by Joseph Beaumont on 3/4/15.
//  Copyright (c) 2015 Joseph Beaumont. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWBDataModel : NSObject {
    NSMutableArray *webList;
    NSMutableArray *labelList;
}

@property(nonatomic, strong) NSMutableArray *webList;
@property(nonatomic, strong) NSMutableArray *labelList;

+ (id)sharedDataModel;
- (NSUInteger)getWebListSize;
- (NSMutableArray *)getWebList;
- (NSMutableArray *)getLabelList;
- (void)addWebsite:(NSString *)url label:(NSString *)name;
- (void)deleteWebsite:(NSString *)url label:(NSString *)name;

@end
