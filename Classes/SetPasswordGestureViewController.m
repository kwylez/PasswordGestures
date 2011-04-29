    //
//  SetPasswordGestureViewController.m
//  PasswordGestures
//
//  Created by Cory Wiles on 11/30/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import "SetPasswordGestureViewController.h"

@interface SetPasswordGestureViewController()

- (void)handleRotationGesture:(UIRotationGestureRecognizer *)gesture;
- (void)handlePinchGesture:(UIPinchGestureRecognizer *)gesture;
- (void)handleTapGesture:(UITapGestureRecognizer *)gesture;
- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture;
- (void)handleSwipeLeftGesture:(UISwipeGestureRecognizer *)gesture;
- (void)handleSwipeRightGesture:(UISwipeGestureRecognizer *)gesture;
- (void)handleSwipeUpGesture:(UISwipeGestureRecognizer *)gesture;
- (void)handleSwipeDownGesture:(UISwipeGestureRecognizer *)gesture;
- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)gesture;
- (void)incrementNumOfSeconds;
- (BOOL)arePasswordsEqualed;

@end

@implementation SetPasswordGestureViewController

@synthesize timer;
@synthesize numSeconds;
@synthesize isConfirming;
@synthesize confirmPasswordArray;
@synthesize initPasswordArray;

- (void)dealloc {
  
  [timer release];
  [confirmPasswordArray release];
  [initPasswordArray release];
	[super dealloc];
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  
	mainView.backgroundColor = [UIColor blackColor];
	
	self.view = mainView;
	
	[mainView release];
  
  [PasswordManager sharedManager].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
  
  isConfirming = NO;
  
  self.confirmPasswordArray = nil;
  self.initPasswordArray    = nil;
  
  self.confirmPasswordArray = [[NSMutableArray alloc] init];
  self.initPasswordArray    = [[NSMutableArray alloc] init];
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
  
  UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
                                                                                    target:self action:@selector(cancelSettingPassword)];
  self.navigationItem.leftBarButtonItem = cancelButtonItem;
  
  [cancelButtonItem release];
  
  UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" 
                                                                     style:UIBarButtonItemStyleDone 
                                                                    target:self 
                                                                    action:@selector(confirmingPasswordAction)];
  
  self.navigationItem.rightBarButtonItem         = doneButtonItem;
  self.navigationItem.rightBarButtonItem.enabled = NO;
  
  [doneButtonItem release];
  
  self.numSeconds = 0 ;

	/**
	 * Rotation Gesture
	 */
	UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self 
                                                                                              action:@selector(handleRotationGesture:)];
	
	[self.view addGestureRecognizer:rotationGesture];
	
	[rotationGesture release];
	
	/**
	 * Pinch Gesture
	 */
	UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self 
                                                                                     action:@selector(handlePinchGesture:)];
	
	[self.view addGestureRecognizer:pinchGesture];
	
	[pinchGesture release];
	
	/**
	 * Tap Gesture
	 */
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                                               action:@selector(handleTapGesture:)];
  
	tapGesture.numberOfTapsRequired    = 1;
	tapGesture.numberOfTouchesRequired = 1;
	
	[self.view addGestureRecognizer:tapGesture];
	
	[tapGesture release];
	
	/**
	 * Swipe Gesture - Right
	 */
	UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                                                          action:@selector(handleSwipeRightGesture:)];
  
	rightSwipeGesture.direction							  = UISwipeGestureRecognizerDirectionRight;
	rightSwipeGesture.numberOfTouchesRequired = 1;
	
	[self.view addGestureRecognizer:rightSwipeGesture];
	
	[rightSwipeGesture release];
	
	/**
	 * Swipe Gesture - Left
	 */
	UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                                                         action:@selector(handleSwipeLeftGesture:)];
	
	leftSwipeGesture.direction							 = UISwipeGestureRecognizerDirectionLeft;
	leftSwipeGesture.numberOfTouchesRequired = 1;
	
	[self.view addGestureRecognizer:leftSwipeGesture];
	
	[leftSwipeGesture release];
	
	/**
	 * Swipe Gesture - Down
	 */
	UISwipeGestureRecognizer *downSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                                                         action:@selector(handleSwipeDownGesture:)];
	
	downSwipeGesture.direction							 = UISwipeGestureRecognizerDirectionDown;
	downSwipeGesture.numberOfTouchesRequired = 1;
	
	[self.view addGestureRecognizer:downSwipeGesture];
	
	[downSwipeGesture release];
	
	/**
	 * Swipe Gesture - Up
	 */
	UISwipeGestureRecognizer *upSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                                                       action:@selector(handleSwipeUpGesture:)];
	
	upSwipeGesture.direction							 = UISwipeGestureRecognizerDirectionUp;
	upSwipeGesture.numberOfTouchesRequired = 1;
	
	[self.view addGestureRecognizer:upSwipeGesture];
	
	[upSwipeGesture release];
	
	/**
	 * Pan Gesture
	 */
	UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self 
                                                                               action:@selector(handlePanGesture:)];
	
	panGesture.minimumNumberOfTouches = 2;
	panGesture.maximumNumberOfTouches = 4;
	
	[self.view addGestureRecognizer:panGesture];
	
	[panGesture release];
	
	/**
	 * Long Press Gesture
	 */
	UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self 
                                                                                                 action:@selector(handleLongPressGesture:)];
	
	longPressGesture.minimumPressDuration = 1.0f;
	
	[self.view addGestureRecognizer:longPressGesture];
	
	[longPressGesture release];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark -
#pragma Informaal Protocol Methods

- (void)handleRotationGesture:(UIRotationGestureRecognizer *)gesture {
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
	
	static CGFloat finalRotation = 0.0f;
	static CGFloat previousPoint = 0.0f;
	BOOL isRight;
	
  if (gesture.state == UIGestureRecognizerStateEnded){
    
    finalRotation = gesture.rotation;
		
		//NSLog(@"rotation: %f", gesture.rotation * (180 / M_PI));
    
    isRight = ((gesture.rotation * (180 / M_PI)) - (previousPoint * (180 / M_PI))) >= 0 ? YES : NO;
    
    RotateGesture *rotateGesture = [[RotateGesture alloc] init];
    
    rotateGesture.isRightRotation = isRight;
    rotateGesture.rotateGesture   = UIRotateGesture;
    
    [self saveGesture:rotateGesture confirming:isConfirming];
    
    [rotateGesture release];
    
  } else if (gesture.state == UIGestureRecognizerStateBegan) {
    
		previousPoint    = gesture.rotation;
    gesture.rotation = finalRotation;
		
		//NSLog(@"rotatin start: %f", previousPoint * (180 / M_PI));
  }
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer *)gesture {
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
	if (gesture.state == UIGestureRecognizerStateEnded) {
		
		//NSLog(@"final result: %f", gesture.scale);
    
    PinchGesture *pinchGesture = [[PinchGesture alloc] init];
    
    pinchGesture.gestureVelocity = gesture.velocity;
    pinchGesture.gestureScale    = gesture.scale;
    pinchGesture.pinchGesture    = UIPinchGesture;
		
		if (gesture.scale > 1.0) {
			//NSLog(@"zoom out");
      pinchGesture.isZoomOut = YES;
		} else {
      //NSLog(@"zoom in");
      pinchGesture.isZoomOut = NO;
		}
    
    [self saveGesture:pinchGesture confirming:isConfirming];
    
    [pinchGesture release];
    
	} else if (gesture.state == UIGestureRecognizerStateBegan) {
    //NSLog(@"start result: %f", gesture.scale);
	}
}

- (void)handleTapGesture:(UITapGestureRecognizer *)gesture {
  
	//NSLog(@"i am tap gesture");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
	
  TapGesture *tapGesture = [[TapGesture alloc] init];
  
  tapGesture.tapGesture = UITapGesture;
  
  [self saveGesture:tapGesture confirming:isConfirming];
  
  [tapGesture release];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
	
  //NSLog(@"pan gesture");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
  if (gesture.state == UIGestureRecognizerStateEnded) {
    
    PanGesture *panGesture = [[PanGesture alloc] init];
    
    panGesture.panGesture      = UIPanGesture;
    panGesture.numberOfTouches = gesture.numberOfTouches;
    
    [self saveGesture:panGesture confirming:isConfirming];
    
    [panGesture release];
  }
}

- (void)handleSwipeLeftGesture:(UISwipeGestureRecognizer *)gesture {
	
  //NSLog(@"left gesture swipe");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
  SwipeGesture *swipeGesture = [[SwipeGesture alloc] init];
  
  swipeGesture.swipeGesture = UISwipeLeftGesture;
  
  [self saveGesture:swipeGesture confirming:isConfirming];
  
  [swipeGesture release];
}

- (void)handleSwipeRightGesture:(UISwipeGestureRecognizer *)gesture {
	
  //NSLog(@"right gesture swipe");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
  SwipeGesture *swipeGesture = [[SwipeGesture alloc] init];
  
  swipeGesture.swipeGesture = UISwipeRightGesture;
  
  [self saveGesture:swipeGesture confirming:isConfirming];
  
  [swipeGesture release];
}

- (void)handleSwipeDownGesture:(UISwipeGestureRecognizer *)gesture {
	
  //NSLog(@"swipe gesture down");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
  SwipeGesture *swipeGesture = [[SwipeGesture alloc] init];
  
  swipeGesture.swipeGesture = UISwipeDownGesture;
  
  [self saveGesture:swipeGesture confirming:isConfirming];
  
  [swipeGesture release];
}

- (void)handleSwipeUpGesture:(UISwipeGestureRecognizer *)gesture {
	
  //NSLog(@"swipe gesture up");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
  SwipeGesture *swipeGesture = [[SwipeGesture alloc] init];
  
  swipeGesture.swipeGesture = UISwipeUpGesture;
  
  [self saveGesture:swipeGesture confirming:isConfirming];
  
  [swipeGesture release];
}

- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)gesture {

	//NSLog(@"long press gesture");
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
  
	if (gesture.state == UIGestureRecognizerStateEnded) {
  
    LongPressGesture *longPressGesture = [[LongPressGesture alloc] init];
    
    longPressGesture.longPressGesture = UILongPressGesture;
    longPressGesture.numberOfSeconds  = numSeconds;
    
    //NSLog(@"number of seconds: %d", numSeconds);
    
    [self saveGesture:longPressGesture confirming:isConfirming];
    
    [longPressGesture release];
    
    [self.timer invalidate];

    self.timer = nil;
    
	} else if (gesture.state == UIGestureRecognizerStateBegan) {
  
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(incrementNumOfSeconds)
                                                userInfo:nil
                                                 repeats:YES];
	}
}

#pragma mark -
#pragma mark Private Methods

- (void)incrementNumOfSeconds {
  numSeconds = numSeconds++;
}

- (BOOL)arePasswordsEqualed {
  
  /**
   * Debug arrays
   */
  for (id cp in self.confirmPasswordArray) {
    NSLog(@"cp: %@", cp);
  }
  
  for (id ip in self.initPasswordArray) {
    NSLog(@"ip: %@", ip);
  }
  /**
   * End debug arrays
   */

  /**
   * @todo
   * need address this potential bug. If you don't confirm the password then hit done 
   * what happens is they become equal because the arrays are both empty
   */
  if ([self.confirmPasswordArray isEqualToArray:self.initPasswordArray]) {
    NSLog(@"is equal");
    return YES;
  } else {
    NSLog(@"it is NOT equal");
    return NO;
  }
}

#pragma mark -
#pragma mark Custom Methods

- (void)finishedSettingPassword {

  /**
   * If the passwords are equal then iterate and save it to nsuserdefaults
   */
  if ([self arePasswordsEqualed] && isConfirming) {
    
    for (id gesture in self.initPasswordArray) {
      [[PasswordManager sharedManager] saveGesture:gesture];
    }

  } else {

    isConfirming = NO;
    
    [self.initPasswordArray removeAllObjects];
    [self.confirmPasswordArray removeAllObjects];
    
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Confirm" 
                                                                       style:UIBarButtonItemStyleDone 
                                                                      target:self 
                                                                      action:@selector(confirmingPasswordAction)];
    
    self.navigationItem.rightBarButtonItem         = doneButtonItem;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [doneButtonItem release];
  }
}

- (void)confirmingPasswordAction {
  
  isConfirming = YES;
  
  UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                                                                                  target:self 
                                                                                  action:@selector(finishedSettingPassword)];
  
  self.navigationItem.rightBarButtonItem = doneButtonItem;
  
  [doneButtonItem release];
}

- (void)saveGesture:(id)gesture confirming:(BOOL)confirming {
  
  if (confirming) {
    NSLog(@"is confirming");
    [self.confirmPasswordArray addObject:gesture];
  } else {
    NSLog(@"is not confirming:");
    [self.initPasswordArray addObject:gesture];
  }
}

- (void)cancelSettingPassword {

  NSUserDefaults *prefs       = [NSUserDefaults standardUserDefaults];
  NSData *passwordGestureData = nil;
  
  [prefs setObject:passwordGestureData forKey:kPasswordGestureKey];
  
  [prefs synchronize];
  
  [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Gesture Delegate Protocol Methods
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
	return YES;
}

#pragma mark - PasswordGestureDelegate Methods
- (void)saveGestureDidSucceed {
  NSLog(@"did save successfully");
}

- (void)saveGestureDidFail {
  NSLog(@"did not save successfully");
}


@end
