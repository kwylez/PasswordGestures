//
//  Password.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PasswordManager.h"

@interface PasswordManager()

 /**
	* Private Methods
	*/
- (void)saveGestureToNSUserDefaults:(id)gesture;

@end

@implementation PasswordManager

@synthesize delegate;

static PasswordManager *sharedPasswordManager = nil;

+ (PasswordManager *)sharedManager {
  
  if (sharedPasswordManager == nil) {
    sharedPasswordManager = [[super allocWithZone:NULL] init];
  }
	
  return sharedPasswordManager;  
}

+ (id)allocWithZone:(NSZone *)zone {
  return [[self sharedManager] retain];
}

- (id)copyWithZone:(NSZone *)zone {
  return self;  
}

- (id)retain {
  return self;
}

- (NSUInteger)retainCount{
  return NSUIntegerMax;//denotes an object that cannot be released
}

- (void)release{
	//do nothing
}

- (id)autorelease {
  return self;
}

/**
 * Custom Methods
 */
- (void)saveGesture:(id)gesture {
	[self saveGestureToNSUserDefaults:gesture];
}

/**
 * Private Methods
 */
- (void)saveGestureToNSUserDefaults:(id)gesture {
	
  NSUserDefaults *prefs       = [NSUserDefaults standardUserDefaults];
  NSData *passwordGestureData = [prefs objectForKey:kPasswordGestureKey];
  
  NSMutableArray *passwordArray;

  if (passwordGestureData != nil) {
    
    NSArray *gestsArray = [NSKeyedUnarchiver unarchiveObjectWithData:passwordGestureData];
    
    if (gestsArray != nil) {
      passwordArray = [[NSMutableArray alloc] initWithArray:gestsArray];
    }
    
    NSLog(@"notesData isn't nil");

  } else {
    passwordArray = [[NSMutableArray alloc] init];
  }
  
  [passwordArray addObject:gesture];
  
  NSLog(@"count of passwordArray: %d", [passwordArray count]);
  
  NSData *finalData = [NSKeyedArchiver archivedDataWithRootObject:passwordArray];
  
  [prefs setObject:finalData forKey:kPasswordGestureKey];
  
  if ([prefs synchronize]) {
    
    if ([delegate respondsToSelector:@selector(saveGestureDidSucceed)]) {
      [delegate saveGestureDidSucceed];  
    }
  } else {
    
    if ([delegate respondsToSelector:@selector(saveGestureDidFail)]) {
      [delegate saveGestureDidFail];  
    }
  }
  
  [passwordArray release];
}

@end
