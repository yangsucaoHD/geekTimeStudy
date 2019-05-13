//
//  ABTestViewController.h
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/13.
//  Copyright © 2019年 郝丹. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ABTestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *centerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;

- (IBAction)resetTests:(id)sender;
@end

