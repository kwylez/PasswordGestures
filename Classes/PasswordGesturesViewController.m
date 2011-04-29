//
//  PasswordGesturesViewController.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PasswordGesturesViewController.h"


@implementation PasswordGesturesViewController

- (void)loadView {

  UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];

	mainView.backgroundColor = [UIColor blackColor];
	
	self.view = mainView;
	
	[mainView release];
}

- (void)viewDidLoad {
  
  /**
   * Iterate over NSUserDefaults
   */
  NSUserDefaults *prefs       = [NSUserDefaults standardUserDefaults];
  NSData *passwordGestureData = [prefs objectForKey:kPasswordGestureKey];
  
  if (passwordGestureData != nil) {
    
    NSArray *gestsArray = [NSKeyedUnarchiver unarchiveObjectWithData:passwordGestureData];
    
    if (gestsArray != nil) {
      for (id obj in gestsArray) {
        NSLog(@"object in password: %@", obj);
      }
    }
  }
  /**
   * End of debugging
   */
  UIButton *setPasswordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  
  setPasswordButton.frame = CGRectMake(20, 100, 200, 40);

  [setPasswordButton setTitle:@"Set Password" forState:UIControlStateNormal];
  [setPasswordButton addTarget:self action:@selector(presentSetPasswordVC) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:setPasswordButton];
  
  UIButton *passReminderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  
  passReminderButton.frame = CGRectMake(20, 150, 200, 40);
  
  [passReminderButton setTitle:@"Password Reminder" forState:UIControlStateNormal];
  [passReminderButton addTarget:self action:@selector(presentReminderPasswordVC) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:passReminderButton];
  
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)dealloc {
	[super dealloc];
}

#pragma mark -
#pragma mark Custom Methods

- (void)presentSetPasswordVC {
  
  SetPasswordGestureViewController *setPass = [[SetPasswordGestureViewController alloc] init];
  
  setPass.title = @"Set Password";
  
  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setPass];
  
  [setPass release];
  
  [self presentModalViewController:navController animated:YES];
  
  [navController release];
}

- (void)presentReminderPasswordVC {
  
  PasswordReminderViewController *reminder = [[PasswordReminderViewController alloc] init];
  
  [self presentModalViewController:reminder animated:YES];
  
  [reminder release];
}

@end
