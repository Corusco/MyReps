//
//  Representative.h
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface Representative : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *party;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *district;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *office;
@property (strong, nonatomic) NSString *link;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (UIColor *)partyColor;

@end
