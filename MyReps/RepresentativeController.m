//
//  RepresentativeController.m
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RepresentativeController.h"
#import "Representative.h"

@interface RepresentativeController()

@property (strong, nonatomic) NSArray *representatives;

@end

@implementation RepresentativeController

+ (RepresentativeController *)sharedInstance
{
    static RepresentativeController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RepresentativeController new];
    });
    return sharedInstance;
}

- (void)searchZipCode:(NSString *)zipCode
{
    NSString *urlString = [NSString stringWithFormat:@"http://whoismyrepresentative.com/getall_mems.php?zip=%@&output=json", zipCode];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"ERROR: %@", error.localizedDescription);
        }
        else
        {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *resultsArray = results[@"results"];
            
            NSMutableArray *repArray = [NSMutableArray new];
            
            for (NSDictionary *repDictionary in resultsArray)
            {
                Representative *rep = [[Representative alloc] initWithDictionary:repDictionary];
                [repArray addObject:rep];
            }
            
            self.representatives = [repArray copy];
            [[NSNotificationCenter defaultCenter] postNotificationName:kSearchCompleteNotification object:nil];
        }
        
    }];
    
    [task resume];
}

@end
