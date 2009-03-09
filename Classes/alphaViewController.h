//
//  alphaViewController.h
//  Purdue Dir
//
//  Created by Ryan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>


@class Person;

@interface alphaViewController : UIViewController {
	
	IBOutlet UITableView *tableView;
	IBOutlet UIToolbar *toolBar;
	UIBarButtonItem *addContact;
	
	Person *person;
}

@property (nonatomic, retain) Person *person;
@property (nonatomic, readonly) UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *addContact;

- (IBAction) addContact:(id)sender;


@end
