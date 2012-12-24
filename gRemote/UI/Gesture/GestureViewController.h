//
//  GestureViewController.h
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureViewController : UIViewController

@property(nonatomic, retain) UIButton* currentServerButton;
@property(nonatomic, retain) UIButton* showServersButton;
@property(nonatomic, retain) UIButton* switchKeyboardButton;
@property(nonatomic, retain) UIButton* settingsButton;

@property(nonatomic, retain) UILabel* directionLabel;

@end
