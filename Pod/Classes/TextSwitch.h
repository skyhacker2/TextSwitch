//
//  TextSwitch.h
//  Pods
//
//  Created by Eleven Chen on 15/8/4.
//
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface TextSwitch : UIControl

@property (strong, nonatomic) IBInspectable UIImage *onImage;
@property (strong, nonatomic) IBInspectable UIImage *offImage;
@property (strong, nonatomic) IBInspectable UIImage *thumbImage;
@property (strong, nonatomic) IBInspectable NSString* onText;
@property (strong, nonatomic) IBInspectable NSString* offText;
@property (strong, nonatomic) UILabel* textLabel;
@property (assign, nonatomic) IBInspectable BOOL on;
@property (assign, nonatomic) IBInspectable CGFloat padding;
@property (assign, nonatomic) IBInspectable CGFloat fontSize;
@property (assign, nonatomic) IBInspectable BOOL bold;


@end
