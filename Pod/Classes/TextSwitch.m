//
//  TextSwitch.m
//  Pods
//
//  Created by Eleven Chen on 15/8/4.
//
//

#import "TextSwitch.h"

@interface TextSwitch()

@property (strong, nonatomic) UIImageView* offImageView;
@property (strong, nonatomic) UIImageView* onImageView;
@property (strong, nonatomic) UIImageView* thumbImageView;
@property (assign, nonatomic) CGPoint touchPoint;
@property (assign, nonatomic, getter=isAnimating) BOOL animating;

@end

@implementation TextSwitch



- (instancetype) init
{
    self = [super init];
    [self setup];
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    [self setup];
    
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup
{
    self.fontSize = 15;
    self.bold = NO;
    self.offImageView = [[UIImageView alloc] init];

    self.offImageView.contentMode = UIViewContentModeCenter;
    self.onImageView = [[UIImageView alloc] init];
    self.onImageView.contentMode = UIViewContentModeCenter;
    self.thumbImageView = [[UIImageView alloc] init];
    self.thumbImageView.contentMode = UIViewContentModeCenter;
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.numberOfLines = 1;
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.onImageView];
    [self addSubview:self.offImageView];
    [self addSubview:self.thumbImageView];
    [self.thumbImageView addSubview:self.textLabel];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.thumbImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.thumbImageView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0f
                                                                     constant:0]];
    [self.thumbImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.textLabel
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.thumbImageView
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0f
                                                                     constant:0]];
}

- (void) setView: (UIView*) view position:(CGPoint) point
{
    CGRect frame = view.frame;
    frame.origin.x = point.x;
    frame.origin.y = point.y;
    view.frame = frame;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = self.offImageView.bounds.size.height > self.onImageView.bounds.size.height ? self.offImageView.bounds.size.height : self.onImageView.bounds.size.height;
    CGFloat y = (self.frame.size.height - h)/2;
    if (!self.isAnimating) {
        if (self.on) {
            [self setView:self.thumbImageView position:CGPointMake(self.frame.size.width - self.thumbImageView.frame.size.width/2 - self.padding, self.bounds.size.height/2 - self.thumbImageView.frame.size.height/2)];
            [self setView:self.offImageView position:CGPointMake(0, y)];
            [self setView:self.onImageView position:CGPointMake(0, y)];
            self.textLabel.text = self.onText;
            self.offImageView.alpha = 0.0f;
            self.onImageView.alpha = 1.0f;
        } else {
            [self setView:self.thumbImageView position:CGPointMake(-self.thumbImageView.frame.size.width/2 + self.padding, self.bounds.size.height/2 - self.thumbImageView.frame.size.height/2)];
            [self setView:self.offImageView position:CGPointMake(0, y)];
            [self setView:self.onImageView position:CGPointMake(0, y)];
            self.textLabel.text = self.offText;
            self.onImageView.alpha = 0.0f;
            self.offImageView.alpha = 1.0f;
        }
    }

}

- (void) updateFrame: (CGRect) rect
{
    CGRect frame = self.frame;
    if (frame.size.width < rect.size.width) {
        frame.size.width = rect.size.width;
    }
    if (frame.size.height < rect.size.height) {
        frame.size.height = rect.size.height;
    }
    self.frame = frame;
}

- (CGSize) intrinsicContentSize
{
    return self.offImageView.frame.size;
}

#pragma mark - public methods
- (void) setOnImage:(UIImage *)onImage
{
    _onImage = onImage;
    self.onImageView.image = onImage;
    CGRect frame = self.onImageView.frame;
    self.onImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, onImage.size.width, onImage.size.height);
    [self updateFrame:self.onImageView.frame];
}

- (void) setOffImage:(UIImage *)offImage
{
    _offImage = offImage;
    self.offImageView.image = offImage;
    CGRect frame = self.offImageView.frame;
    self.offImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, offImage.size.width, offImage.size.height);
    [self updateFrame:self.offImageView.frame];
    [self setNeedsLayout];
}

- (void) setThumbImage:(UIImage *)thumbImage
{
    _thumbImage = thumbImage;
    self.thumbImageView.image = thumbImage;
    CGRect frame = self.thumbImageView.frame;
    self.thumbImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, thumbImage.size.width, thumbImage.size.height);
    [self updateFrame:self.thumbImageView.frame];

    [self setNeedsLayout];
}

- (void) setOnText:(NSString *)onText
{
    _onText = onText;
    if (self.on) {
        self.textLabel.text = onText;
    }
    [self setNeedsLayout];
}

- (void) setOffText:(NSString *)offText
{
    _offText = offText;
    if (!self.on) {
        self.textLabel.text = offText;
    }
    [self setNeedsLayout];
}

- (void) setOn:(BOOL)on
{
    _on = on;
    [self setNeedsLayout];
}

- (void) setPadding:(CGFloat)padding
{
    _padding = padding;
    [self setNeedsLayout];
}

- (void) setFontSize:(CGFloat)fontSize
{
    _fontSize = fontSize;
    self.textLabel.font = [UIFont systemFontOfSize:fontSize];
    [self setNeedsLayout];
}

- (void) setBold:(BOOL)bold
{
    _bold = bold;
    if (bold) {
        self.textLabel.font = [UIFont boldSystemFontOfSize:self.fontSize];
    } else {
        self.textLabel.font = [UIFont systemFontOfSize:self.fontSize];
    }
    [self setNeedsLayout];
}

#pragma mark - actions

- (BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(self.offImageView.frame, self.touchPoint)) {
        return YES;
    }
    return NO;
}

- (BOOL) continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{

    return YES;
}

- (void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.animating = YES;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         if (!self.on) {
                             [self setView:self.thumbImageView position:CGPointMake(self.frame.size.width - self.thumbImageView.frame.size.width/2 - self.padding, self.bounds.size.height/2 - self.thumbImageView.frame.size.height/2)];
                             self.textLabel.text = self.onText;
                             self.onImageView.alpha = 1.0f;
                             self.offImageView.alpha = 0.0f;
                         } else {
                             [self setView:self.thumbImageView position:CGPointMake(-self.thumbImageView.frame.size.width/2 + self.padding, self.bounds.size.height/2 - self.thumbImageView.frame.size.height/2)];
                             self.textLabel.text = self.offText;
                             self.onImageView.alpha = 0.0f;
                             self.offImageView.alpha = 1.0f;
                         }
                     } completion:^(BOOL finished) {
                         self.animating = false;
                         self.on = !self.on;
                         [self sendActionsForControlEvents:UIControlEventValueChanged];
                     }];

}

- (void) cancelTrackingWithEvent:(UIEvent *)event
{
    NSLog(@"%s", __FUNCTION__);
}


@end
