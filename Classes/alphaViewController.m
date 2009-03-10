//
//  alphaViewController.m
//  Purdue Dir
//
//  Created by Ryan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "alphaViewController.h"
#import "Person.h"
#import <AddressBook/AddressBook.h>


@implementation alphaViewController
@synthesize person;
@synthesize toolBar;
@synthesize addContact;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		
		self.person = [[Person alloc] init];
		self.title = @"Details";
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
			cell.text = [person.addr stringByReplacingOccurrencesOfString:@"$" withString:@"\n"];
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
	NSString *mapURL = [[NSString alloc] init];
	
	emailURL = [@"mailto:" stringByAppendingString:person.email];
	telURL = [@"tel:" stringByAppendingString:person.phone];
	telURL = [telURL stringByReplacingOccurrencesOfString:@"-" withString:@""];
	telURL = [telURL stringByReplacingOccurrencesOfString:@" " withString:@""];
	telURL = [telURL stringByReplacingOccurrencesOfString:@"+" withString:@""];	
	mapURL = [@"http://maps.google.com/maps?q=" stringByAppendingString:person.addr];
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
		case 4:
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapURL]];	
			NSLog(@"%@",mapURL);
			break;
	}

	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://google.com"]];
}

- (IBAction) addContact:(id)sender {
	NSLog(@"Got to addContact");
	ABAddressBookRef addressBook = ABAddressBookCreate();
	ABRecordRef newPerson = ABPersonCreate();
	CFErrorRef anError;
	
	//add in the first name, last name, and phone number
	
	NSString *fName = [[NSString alloc] autorelease];
	NSString *lName = [[NSString alloc] autorelease];
	NSString *phone = [[NSString alloc] autorelease];
	NSString *emailAdd = [[NSString alloc] autorelease];
	NSArray *names = [[NSArray	alloc] autorelease];
	
	names = [person.name componentsSeparatedByString:@" "];
	fName = [names objectAtIndex:0];
	if ([names count] >= 3) 
		lName = [names objectAtIndex:2];
	else
		lName = [names objectAtIndex:1];
		
	phone = person.phone;
	emailAdd = person.email;
	
	ABMutableMultiValueRef phoneNumberMultiValue = ABMultiValueCreateMutable(kABPersonPhoneProperty);
	ABMultiValueAddValueAndLabel(phoneNumberMultiValue ,phone,kABPersonPhoneMobileLabel, NULL);
	ABRecordSetValue(newPerson, kABPersonLastNameProperty,lName,&anError);
	ABRecordSetValue(newPerson, kABPersonFirstNameProperty,fName,&anError);
	ABMutableMultiValueRef emailMultiValue = ABMultiValueCreateMutable(kABStringPropertyType);
	ABMultiValueAddValueAndLabel(emailMultiValue ,emailAdd,kABWorkLabel, NULL);
	ABRecordSetValue(newPerson, kABPersonEmailProperty, emailMultiValue, &anError);
	//ABRecordSetValue(newPerson, kABPersonEmailProperty,emailAdd,&anError);
	ABRecordSetValue(newPerson, kABPersonPhoneProperty, phoneNumberMultiValue, &anError);
	ABAddressBookAddRecord(addressBook, newPerson, &anError);
	ABAddressBookSave(addressBook, &anError);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Contact Added"message:@"This contact information has successfully been added to your phone." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}


- (void)dealloc {
	[person release];
	[tableView release];
    [super dealloc];
}


@end
