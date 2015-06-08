//
//  DetailViewController.m
//  MyReps
//
//  Created by TRM on 6/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *partyLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *districtLabel;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UILabel *officeLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameLabel.text = self.representative.name;
    if ([self.representative.party isEqualToString:@"D"])
    {
        self.partyLabel.text = @"Democrat";
    }
    else if ([self.representative.party isEqualToString:@"R"])
    {
        self.partyLabel.text = @"Republican";
    }
    else if ([self.representative.party isEqualToString:@"I"])
    {
        self.partyLabel.text = @"Independent";
    }
    self.stateLabel.text = self.representative.state;
    self.districtLabel.text = self.representative.district;
    [self.phoneButton setTitle:self.representative.phone forState:UIControlStateNormal];
    self.officeLabel.text = self.representative.office;
    self.linkLabel.text = self.representative.link;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Methods

- (IBAction)phoneButtonTapped {
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:self.representative.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
