//
//  KeyboardViewController.m
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "KeyboardViewController.h"

@implementation KeyboardViewController

- (id)init
{
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self.view setBackgroundColor:[UIColor greenColor]];
            
            _closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_closeButton setFrame:CGRectMake(10, 10, 100, 30)];
            [_closeButton setTitle:@"close" forState:UIControlContentHorizontalAlignmentCenter];
            [_closeButton addTarget:self action:@selector(didClickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_closeButton];
        }
    }
    return self;
}

#pragma mark - Button Action

- (void)didClickCloseButton:(UIButton *)button
{
    NSLog(@"didClickCloseButton");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
