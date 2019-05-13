//
//  ABTestViewController.m
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/13.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import "ABTestViewController.h"
#import "SkyLab.h"

@interface ABTestViewController ()

@end

@implementation ABTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Simple A/B Test
    [SkyLab abTestWithName:@"Title" A:^{
        self.titleLabel.text = NSLocalizedString(@"Hello, World!", nil);
    } B:^{
        self.titleLabel.text = NSLocalizedString(@"Greetings, Planet!", nil);
    }];
    
    // Split Test with Weighted Probabilities
    [SkyLab splitTestWithName:@"Subtitle" conditions:@{
                                                       @"Red" : @(0.15),
                                                       @"Green" : @(0.10),
                                                       @"Blue" : @(0.50),
                                                       @"Purple" : @(0.25)
                                                       } block:^(id choice) {
                                                           self.subtitleLabel.text = NSLocalizedString(@"Please Enjoy This Colorful Message", nil);
                                                           
                                                           if ([choice isEqualToString:@"Red"]) {
                                                               self.subtitleLabel.textColor = [UIColor redColor];
                                                           } else if ([choice isEqualToString:@"Green"]) {
                                                               self.subtitleLabel.textColor = [UIColor greenColor];
                                                           } else if ([choice isEqualToString:@"Blue"]) {
                                                               self.subtitleLabel.textColor = [UIColor blueColor];
                                                           } else if ([choice isEqualToString:@"Purple"]) {
                                                               self.subtitleLabel.textColor = [UIColor purpleColor];
                                                           }
                                                       }];
    
    // Multivariate Test
    [SkyLab multivariateTestWithName:@"Switches" variables:@{
                                                             @"Left" : @(0.5),
                                                             @"Center" : @(0.5),
                                                             @"Right" : @(0.5)
                                                             } block:^(NSSet *activeVariables) {
                                                                 self.leftSwitch.on = [activeVariables containsObject:@"Left"];
                                                                 self.centerSwitch.on = [activeVariables containsObject:@"Center"];
                                                                 self.rightSwitch.on = [activeVariables containsObject:@"Right"];
                                                             }];
}

#pragma mark - IBAction

- (IBAction)resetTests:(id)sender {
    [SkyLab resetTestNamed:@"Title"];
    [SkyLab resetTestNamed:@"Subtitle"];
    [SkyLab resetTestNamed:@"Switches"];
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Tests Reset", nil) message:NSLocalizedString(@"Segmentation will be re-run on next launch", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil] show];
}


@end
