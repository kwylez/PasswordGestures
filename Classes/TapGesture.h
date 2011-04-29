//
//  TapGesture.h
//  PasswordGestures
//
//  Created by Cory Wiles on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TapGesture : NSObject <NSCoding> {
  UIGestureType tapGesture;
}

@property UIGestureType tapGesture;

- (BOOL)isEqualToTapGesture:(TapGesture *)aTapGesture;

@end
