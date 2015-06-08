//
//  Representative.m
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Representative.h"

@implementation Representative

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        self.name = dictionary[@"name"];
        self.party = dictionary[@"party"];
        self.state = dictionary[@"state"];
        self.district = dictionary[@"district"];
        self.phone = dictionary[@"phone"];
        self.office = dictionary[@"office"];
        self.link = dictionary[@"link"];
    }
    
    return self;
}

- (UIColor *)partyColor
{
    if ([self.party isEqualToString:@"D"])
    {
        return [UIColor blueColor];
    }
    
    if ([self.party isEqualToString:@"R"])
    {
        return [UIColor redColor];
    }
    
    if ([self.party isEqualToString:@"I"])
    {
        return [UIColor purpleColor];
    }
    
    return [UIColor whiteColor];
}

@end
