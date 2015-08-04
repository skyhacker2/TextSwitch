//
//  TextSwitch.h
//  Pods
//
//  Created by Eleven Chen on 15/8/4.
//
//

#import <UIKit/UIKit.h>

@interface TextSwitch : UIControl

@property (strong, nonatomic) UIImage *onImage;
@property (strong, nonatomic) UIImage *offImage;
@property (strong, nonatomic) UIImage *thumbImage;
@property (strong, nonatomic) NSString* onText;
@property (strong, nonatomic) NSString* offText;
@property (strong, nonatomic) UILabel* textLabel;
@property (assign, nonatomic) BOOL on;
@property (assign, nonatomic) CGFloat padding;


@end
