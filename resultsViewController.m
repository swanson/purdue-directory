//
//  resultsViewController.m
//  Purdue Dir
//
//  Created by Ryan on 3/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "resultsViewController.h"
#import "Purdue_DirAppDelegate.h"


@implementation resultsViewController
@synthesize firstName;
@synthesize lastName;
@synthesize webView;
@synthesize detailedView;

@synthesize button;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //set navbar title
		self.title = @"Results";
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
	//generate php query string
	NSString *query = [[NSString alloc] initWithFormat:@"http://web.ics.purdue.edu/~mdswanso/dir.php?ln=%@&fn=%@", lastName, firstName];
	NSURL *url = [NSURL URLWithString:query];
	NSURLRequest *request=[NSURLRequest requestWithURL:url];
	
	//TODO: replace this with tableview!!
	[webView loadRequest:request];
	
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

- (IBAction)getDetails:(id)sender{
	//call detailedView constructor, which will call Person constructor for us
	detailedView = [[detailedViewController alloc] initWithNibName:@"detailedView" bundle:[NSBundle mainBundle]];
	
	//TODO: fix this when we add the parser!!
	//fill in the person attributes to display
	detailedView.person.name=@"Testy McTest";
	detailedView.person.email=@"test@test.com";
	detailedView.person.phone=@"(123)-456-7890";
	detailedView.person.addr=@"1234 Test Street";	
	detailedView.person.univ=@"Liberal Arts";
	
	//push the detailed contact info view onto the stack
	Purdue_DirAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navigationController pushViewController:detailedView animated:YES];
}


- (void)dealloc {
	[firstName release];
	[lastName release];
	[webView release];
	[detailedView release];
    [super dealloc];
}


@end
