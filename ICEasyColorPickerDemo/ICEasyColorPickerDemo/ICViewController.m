//
//  ICViewController.m
//  ICEasyColorPickerDemo
//
//  Created by Ichito Nagata on 2013/08/18.
//  Copyright (c) 2013年 Ichito Nagata. All rights reserved.
//

#import "ICViewController.h"

@interface ICViewController ()

@end

@implementation ICViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.picker.delegate = self;
}

- (void)colorPicker:(ICEasyColorPicker*)picker didPickedColor:(UIColor*)color
{
    self.pickedColorView.backgroundColor = color;
}

@end
