//
//  ICViewController.h
//  ICEasyColorPickerDemo
//
//  Created by Ichito Nagata on 2013/08/18.
//  Copyright (c) 2013年 Ichito Nagata. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICEasyColorPicker.h"

@interface ICViewController : UIViewController
<ICEasyColorPickerDelegate>

@property (nonatomic, weak) IBOutlet ICEasyColorPicker *picker;
@property (nonatomic, weak) IBOutlet UIView *pickedColorView;

@end
