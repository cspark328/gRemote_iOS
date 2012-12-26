//
//  GestureViewController.m
//  gRemote
//
//  Created by 박찬순 on 12. 12. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "GestureViewController.h"
#import "ServersTableViewController.h"
#import "FilesTableViewController.h"
#import "SettingsTableViewController.h"
#import "KeyboardViewController.h"
#import "ServerHelper.h"

@implementation GestureViewController

- (id)init
{
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self.view setBackgroundColor:[UIColor grayColor]];
            
            ServerHelper* serverHelper = [[ServerHelper alloc] init];
            [serverHelper searchForServices];
            
            CGSize frameSize = self.view.frame.size;
            
            _showServersButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_showServersButton setFrame:CGRectMake(10, 10, 100, 30)];
            [_showServersButton setTitle:@"Server List" forState:UIControlContentHorizontalAlignmentCenter];
            [_showServersButton addTarget:self action:@selector(didClickShowServersButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_showServersButton];
            
            _currentServerButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_currentServerButton setFrame:CGRectMake(120, 10, frameSize.width - 130, 30)];
            [_currentServerButton setTitle:@"CSPark's MacPro" forState:UIControlContentHorizontalAlignmentCenter];
            [_currentServerButton addTarget:self action:@selector(didClickCurrentServerButton:) forControlEvents:UIControlEventTouchUpInside];
            [_currentServerButton setBackgroundColor:[UIColor redColor]];
            [self.view addSubview:_currentServerButton];
            
            _switchKeyboardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_switchKeyboardButton setFrame:CGRectMake(10, frameSize.height - 40, 150, 30)];
            [_switchKeyboardButton setTitle:@"Switch Keyboard" forState:UIControlContentHorizontalAlignmentCenter];
            [_switchKeyboardButton addTarget:self action:@selector(didClickSwitchKeyboardButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_switchKeyboardButton];
            
            _settingsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_settingsButton setFrame:CGRectMake(frameSize.width - 110, frameSize.height - 10 - 30, 100, 30)];
            [_settingsButton setTitle:@"Settings" forState:UIControlContentHorizontalAlignmentCenter];
            [_settingsButton addTarget:self action:@selector(didClickSettingsButton:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_settingsButton];
            
            _directionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, frameSize.width - 20, 30)];
            [self.view addSubview:_directionLabel];
            
            [self initGestureRecognizer];
        }
    }
    return self;
}

#pragma mark - Gesture recognizer

- (void)initGestureRecognizer
{
    UISwipeGestureRecognizer* swipeGestureRecognizer = nil;
    
    swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizer:)];
    [swipeGestureRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeGestureRecognizer];
    
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    //    UIPanGestureRecognizer* panGestureRecognizer = nil;
    //    panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    //
    //    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)swipeGestureRecognizer:(UISwipeGestureRecognizer *)swipeGestureRecognizer
{
    NSString* direction = nil;
    if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        direction = @"UP";
    } else if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        direction = @"DOWN";
    } else if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        direction = @"LEFT";
    } else if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        direction = @"RIGHT";
    } else {
        direction = @"";
    }
    
    [_directionLabel setText:direction];
}

- (void)tapGestureRecognizer:(UISwipeGestureRecognizer *)tapGestureRecognizer
{
    [_directionLabel setText:@"TAP"];
}

- (void)panGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [_directionLabel setText:@"PAN"];
    }
    
}

#pragma mark - Button Action

- (void)didClickShowServersButton:(UIButton *)button
{
    NSLog(@"didClickShowServersButton");
    ServersTableViewController* serversTableViewController = [ServersTableViewController new];
    UINavigationController* serversNavigationController = [[UINavigationController alloc] initWithRootViewController:serversTableViewController];
    
    [self presentViewController:serversNavigationController animated:YES completion:nil];
}

- (void)didClickCurrentServerButton:(UIButton *)button
{
    NSLog(@"didClickCurrentServerButton");
    FilesTableViewController* filesTableViewController = [FilesTableViewController new];
    UINavigationController* filesNavigationController = [[UINavigationController alloc] initWithRootViewController:filesTableViewController];
    
    [self presentViewController:filesNavigationController animated:YES completion:nil];
}

- (void)didClickSwitchKeyboardButton:(UIButton *)button
{
    NSLog(@"didClickSwitchKeyboardButton");
    KeyboardViewController* keyboardViewController = [KeyboardViewController new];
    [keyboardViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:keyboardViewController animated:YES completion:nil];
}

- (void)didClickSettingsButton:(UIButton *)button
{
    NSLog(@"didClickSettingsButton");
    SettingsTableViewController* settingsTableViewController = [SettingsTableViewController new];
    UINavigationController* settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsTableViewController];
    
    [self presentViewController:settingsNavigationController animated:YES completion:nil];
}

@end
