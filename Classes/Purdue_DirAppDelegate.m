//
//  Purdue_DirAppDelegate.m
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Purdue_DirAppDelegate.h"
#import "RootViewController.h"


@implementation Purdue_DirAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
