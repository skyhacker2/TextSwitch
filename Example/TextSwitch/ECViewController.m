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
@property (strong, nonatomic) TextSwitch* switch3;

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
    textSwitch.offText = @"OFF";
    textSwitch.onText = @"ON";
    textSwitch.padding = 20;
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
    
    TextSwitch* textSwitch3 = [[TextSwitch alloc] initWithFrame:CGRectZero];
    textSwitch3.onImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch3.offImage = [UIImage imageNamed:@"OffImage.png"];
    textSwitch3.thumbImage = [UIImage imageNamed:@"Thumb.png"];
    textSwitch3.padding = 20;
    [self.view addSubview:textSwitch3];
    self.switch3 = textSwitch3;
    self.switch3.translatesAutoresizingMaskIntoConstraints = NO;
    NSLog(@"%f", self.switch3.frame.size.height);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.view setNeedsUpdateConstraints];
    NSLog(@"%f", self.switch3.frame.size.height);
}

- (void) updateViewConstraints
{
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.switch3
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.switch3
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0f
                                                           constant:0.0f]];
    NSDictionary* views = @{@"switch": self.switch3};
    NSNumber* width = [NSNumber numberWithFloat:self.switch3.frame.size.width];
    NSNumber* height = [NSNumber numberWithFloat:self.switch3.frame.size.height];
    NSDictionary* metrics = @{@"width": width, @"height": height};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[switch(==width)]" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[switch(==height)]" options:0 metrics:metrics views:views]];
    
    [super updateViewConstraints];
}

- (void) onValueChanged: (TextSwitch*) sender
{
    NSLog(@"on %@", sender.on? @"yes": @"no");
}

@end
