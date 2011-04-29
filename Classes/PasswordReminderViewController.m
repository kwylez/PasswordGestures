    //
//  PasswordReminderViewController.m
//  PasswordGestures
//
//  Created by Cory Wiles on 12/28/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import "PasswordReminderViewController.h"

@implementation PasswordReminderViewController

@synthesize tblView;
@synthesize activityView;
@synthesize imageAssets;

- (void)dealloc {
  [tblView release];
  [activityView release];
  [imageAssets release];
  [super dealloc];
}

- (void)loadView {
  
  UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
  
	mainView.backgroundColor = [UIColor blackColor];
	
	self.view = mainView;
	
	[mainView release];
  
  self.tblView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];

  self.tblView.delegate   = self;
  self.tblView.dataSource = self;
  
  [self.view addSubview:self.tblView];
  
  self.activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];

  self.activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
  
  [self.view addSubview:self.activityView];
}

- (void)viewDidLoad {
 
  NSLog(@"inside view did load");
  
  [self.activityView startAnimating];
  
  void (^assetEnumerator)(struct ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
    NSLog(@"inside first block");
    if (result != NULL) {

      NSLog(@"See Asset: %@", result);
      
      [imageAssets addObject:result];
    } else {
      NSLog(@"the result is null");
    }
  };
  
  void (^assetGroupEnumerator)(struct ALAssetsGroup *, BOOL *) =  ^(ALAssetsGroup *group, BOOL *stop) {
    NSLog(@"inside second block");
    if (group != nil) {
      NSLog(@"group is NOT nil");
      [group enumerateAssetsUsingBlock:assetEnumerator];
    } else {
      NSLog(@"group is nil");
    }
    
    [self.tblView reloadData];
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
  };
  
  imageAssets = [[NSMutableArray alloc] init];
  
  ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
  
  [library enumerateGroupsWithTypes:ALAssetsGroupAlbum
                         usingBlock:assetGroupEnumerator
                       failureBlock: ^(NSError *error) {
                         NSLog(@"Failure");
                       }];
  
  NSLog(@"count: %d", [self.imageAssets count]);
  
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.imageAssets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  ALAsset *asset = [imageAssets objectAtIndex:indexPath.row];

	[cell.imageView setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
	
  [cell.textLabel setText:[NSString stringWithFormat:@"Photo %d", indexPath.row+1]];
  
  return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
  /*
   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
   // ...
   // Pass the selected object to the new view controller.
   [self.navigationController pushViewController:detailViewController animated:YES];
   [detailViewController release];
   */
}


@end
