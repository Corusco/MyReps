//
//  RepresentativeController.h
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kSearchCompleteNotification = @"searchComplete";

@interface RepresentativeController : NSObject

@property (strong, nonatomic, readonly) NSArray *representatives;

+ (RepresentativeController *)sharedInstance;
- (void)searchZipCode:(NSString *)zipCode;

@end
