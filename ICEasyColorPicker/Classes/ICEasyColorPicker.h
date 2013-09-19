//
//  ICEasyColorPicker.h
//  ICEasyColorPicker
//
//  Created by Ichito Nagata on 2013/08/18.
//
//

#import <UIKit/UIKit.h>

typedef enum {
    ICEasyColorPickerDirectionVertical = 1,
    ICEasyColorPickerDirectionHorizontal = 2,
} ICEasyColorPickerDirection;

@class ICEasyColorPicker;
@protocol ICEasyColorPickerDelegate <NSObject>
- (void)colorPicker:(ICEasyColorPicker*)picker didPickedColor:(UIColor*)color;
@end

@interface ICEasyColorPicker : UIView

@property (nonatomic) id<ICEasyColorPickerDelegate> delegate;
@property (nonatomic) NSArray *colors;
@property (nonatomic) ICEasyColorPickerDirection direction;


@end
