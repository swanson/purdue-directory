//
//  detailedViewController.h
//  Purdue Dir
//
//  Created by matt on 3/3/09.
//  Copyright 2009 M$. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface detailedViewController : UIViewController {
	Person *person;
	UILabel *name;
	UILabel *email;
	UILabel *phone;
	UILabel *addr;
	UILabel *univ;
}

@property (nonatomic, retain) Person *person;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *email;
@property (nonatomic, retain) IBOutlet UILabel *phone;
@property (nonatomic, retain) IBOutlet UILabel *addr;
@property (nonatomic, retain) IBOutlet UILabel *univ;

@end
