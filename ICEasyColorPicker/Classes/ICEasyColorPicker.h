//
//  ICEasyColorPicker.h
//  ICEasyColorPicker
//
//  Created by Ichito Nagata on 2013/08/18.
//
//

#import <UIKit/UIKit.h>

@class ICEasyColorPicker;
@protocol ICEasyColorPickerDelegate <NSObject>
- (void)colorPicker:(ICEasyColorPicker*)picker didPickedColor:(UIColor*)color;
@end

@interface ICEasyColorPicker : UIView

@property (nonatomic) id<ICEasyColorPickerDelegate> delegate;
@property (nonatomic) NSArray *colors;

@end
