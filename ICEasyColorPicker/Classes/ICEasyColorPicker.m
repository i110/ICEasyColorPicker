//
//  ICEasyColorPicker.m
//  ICEasyColorPicker
//
//  Created by Ichito Nagata on 2013/08/18.
//
//

#import <QuartzCore/QuartzCore.h>

#import "ICEasyColorPicker.h"

@interface ICEasyColorPicker ()
{
    CAGradientLayer *gradient;
}

@end

@implementation ICEasyColorPicker

- (void)initialize
{
    self.colors = [[self class] rainbowColors];
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 3;
    self.layer.borderColor = [UIColor colorWithWhite:0.5 alpha:0.5].CGColor;
    
    self.layer.shadowRadius = 3;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0, 0);

    self.clipsToBounds = NO;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

+ (NSArray*)rainbowColors
{
    static NSArray *rainbowColors;
    if (rainbowColors == nil) {
        NSMutableArray *c = [NSMutableArray array];

        [c addObject:[UIColor redColor]];
        [c addObject:[UIColor magentaColor]];
        [c addObject:[UIColor blueColor]];
        [c addObject:[UIColor cyanColor]];
        [c addObject:[UIColor greenColor]];
        [c addObject:[UIColor yellowColor]];
        rainbowColors = [NSArray arrayWithArray:c];
    }
    return rainbowColors;
}

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (void)drawGradient
{
    if (self.colors == nil) {
        self.colors = [[self class] rainbowColors];
    }
    
    NSMutableArray *gradualColors = [NSMutableArray array];
    for (UIColor *color in self.colors) {
        [gradualColors addObject:(id)color.CGColor];
    }
    [gradualColors addObject:(id)((UIColor*)[self.colors objectAtIndex:0]).CGColor];

    
    NSMutableArray *locations = [NSMutableArray array];
    NSUInteger colorCount = gradualColors.count;
    CGFloat perColor = 1.0f / (colorCount - 1);
    for (NSUInteger i = 0; i < colorCount; i++) {
        [locations addObject:[NSNumber numberWithFloat:perColor * i]];
    }

    ((CAGradientLayer*)self.layer).colors = gradualColors;
    ((CAGradientLayer*)self.layer).locations = locations;

}

- (void)setColors:(NSArray *)colors
{
    _colors = colors;
    [self drawGradient];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self drawGradient];
}

- (CGPoint)touchPointOfEvent:(UIEvent*)event
{
    UITouch *touch = [[event touchesForView:self] anyObject];
    CGPoint point = [touch locationInView:self];
    // point.y = self.bounds.size.height - point.y;
    return point;
}

- (UIColor*)colorFromPoint:(CGPoint)point
{
    CGFloat offset = point.y * self.colors.count / self.bounds.size.height;
    NSUInteger colorIndex = (int)offset;
    CGFloat rate = offset - colorIndex;
    NSLog(@"%f, %f, %f, %d, %f", point.y, self.bounds.size.height, offset, colorIndex, rate);
    
    UIColor *color1 = [self.colors objectAtIndex:colorIndex];
    UIColor *color2 = [self.colors objectAtIndex:(colorIndex + 1) % self.colors.count];

    const float *c1 = CGColorGetComponents(color1.CGColor);
    const float *c2 = CGColorGetComponents(color2.CGColor);
    
    CGFloat r = c2[0] * rate + c1[0] * (1 - rate);
    CGFloat g = c2[1] * rate + c1[1] * (1 - rate);
    CGFloat b = c2[2] * rate + c1[2] * (1 - rate);
    CGFloat a = c2[3] * rate + c1[3] * (1 - rate);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(colorPicker:didPickedColor:)]) {
        CGPoint point = [self touchPointOfEvent:event];
        if (CGRectContainsPoint(self.bounds, point)) {
            UIColor *color = [self colorFromPoint:point];
            [self.delegate colorPicker:self didPickedColor:color];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(colorPicker:didPickedColor:)]) {
        CGPoint point = [self touchPointOfEvent:event];
        if (CGRectContainsPoint(self.bounds, point)) {
            UIColor *color = [self colorFromPoint:point];
            [self.delegate colorPicker:self didPickedColor:color];
        }
    }
}


@end
