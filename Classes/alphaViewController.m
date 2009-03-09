//
//  alphaViewController.m
//  Purdue Dir
//
//  Created by Ryan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "alphaViewController.h"
#import "Person.h"


@implementation alphaViewController
@synthesize person;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Details";
		self.person = [[Person alloc] init];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (	UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	switch(indexPath.section)
	{
		case 0:
			cell.text = person.name;
			break;
		case 1:
			cell.text = person.email;
			break;
		case 2:
			cell.text = person.phone;
			break;
		case 3:
			cell.text = person.univ;
			break;
		case 4:
			cell.text = person.addr;
			break;
	}
	return cell;
	
}

- (NSString *)tableView:(UITableView *)tblView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = nil;
	switch(section)
	{
		case 0:
			sectionName = [NSString stringWithString:@"Name"];
			break;
		case 1:
			sectionName = [NSString stringWithString:@"Email"];
			break;
		case 2:
			sectionName = [NSString stringWithString:@"Phone Number"];
			break;
		case 3:
			sectionName = [NSString stringWithString:@"School"];
			break;
		case 4:
			sectionName = [NSString stringWithString:@"Address"];
			break;
	}
	return sectionName;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger index = [indexPath section];
	[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
	NSString *emailURL = [[	NSString alloc] init];
	NSString *telURL = [[NSString alloc] init];
	emailURL = [@"mailto:" stringByAppendingString:person.email];
	telURL = [@"tel:" stringByAppendingString:person.phone];
	switch(index)
	{
		case 1:

		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:emailURL]];	
			NSLog(@"%@",emailURL);
			break;
		case 2:
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:telURL]];	
			NSLog(@"%@",telURL);
			break;
	}

	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://google.com"]];
}


- (void)dealloc {
	[person release];
	[tableView release];
    [super dealloc];
}


@end
