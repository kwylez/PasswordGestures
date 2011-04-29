//
//  Password.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RotateGesture.h"
#import "PasswordGestureProtocol.h"

@interface PasswordManager : NSObject {
  
  id<PasswordGestureDelegate> delegate;
}

@property (nonatomic, assign) id<PasswordGestureDelegate> delegate;

+ (PasswordManager *)sharedManager;
- (void)saveGesture:(id)gesture;

@end
