//
//  alphaViewController.h
//  Purdue Dir
//
//  Created by Ryan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Person;

@interface alphaViewController : UIViewController {
	
	IBOutlet UITableView *tableView;
	
	Person *person;
}

@property (nonatomic, retain) Person *person;


@end
