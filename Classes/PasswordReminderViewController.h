//
//  PasswordReminderViewController.h
//  PasswordGestures
//
//  Created by Cory Wiles on 12/28/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PasswordReminderViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {

  UITableView *tblView;
  UIActivityIndicatorView *activityView;
  
  NSMutableArray *imageAssets;
}

@property (nonatomic, retain) UITableView *tblView;
@property (nonatomic, retain) UIActivityIndicatorView *activityView;
@property (nonatomic, retain) NSMutableArray *imageAssets;

@end
