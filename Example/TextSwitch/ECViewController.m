//
//  ECViewController.m
//  TextSwitch
//
//  Created by Eleven Chen on 08/04/2015.
//  Copyright (c) 2015 Eleven Chen. All rights reserved.
//

#import "ECViewController.h"
#import <TextSwitch/TextSwitch.h>

@interface ECViewController ()

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(50, 100, 0, 0);
    TextSwitch* textSwitch = [[TextSwitch alloc] initWithFrame:frame];
    textSwitch.onImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch.offImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch.thumbImage = [UIImage imageNamed:@"Thumb.png"];
    textSwitch.padding = 20;
    textSwitch.offText = @"OFF";
    textSwitch.onText = @"ON";
    [textSwitch addTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:textSwitch];
    
    CGRect frame2 = CGRectMake(50, 160, 0, 0);
    TextSwitch* textSwitch2 = [[TextSwitch alloc] initWithFrame:frame2];
    textSwitch2.onImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch2.offImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch2.thumbImage = [UIImage imageNamed:@"Thumb.png"];
    textSwitch2.padding = 20;
    textSwitch2.offText = @"关";
    textSwitch2.onText = @"开";
    textSwitch2.textLabel.font = [UIFont systemFontOfSize:20];
    textSwitch2.textLabel.textColor = [UIColor grayColor];
    textSwitch2.on = YES;
    [self.view addSubview:textSwitch2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onValueChanged: (TextSwitch*) sender
{
    NSLog(@"on %@", sender.on? @"yes": @"no");
}

@end
