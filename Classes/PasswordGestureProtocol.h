//
//  PasswordGestureDelegate.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/30/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PasswordGestureDelegate<NSObject>

@required

- (void)saveGestureDidSucceed;
- (void)saveGestureDidFail;


@end
