//
//  detailedViewController.m
//  Purdue Dir
//
//  Created by matt on 3/3/09.
//  Copyright 2009 M$. All rights reserved.
//

#import "detailedViewController.h"


@implementation detailedViewController
@synthesize person, name, email, phone, addr, univ;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title=@"Details";
		self.person = [[Person alloc] init];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	name.text=person.name;
	email.text=person.email;
	phone.text=person.phone;
	addr.text=person.addr;
	univ.text=person.univ;
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[person release];
	[name release];
	[email release];
	[phone release];
	[addr release];
	[univ release];
    [super dealloc];
}


@end
