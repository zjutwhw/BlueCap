//
//  PeripheralDetailViewController.h
//  BlueCapUI
//
//  Created by Troy Stribling on 8/19/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeripheralDetailViewController : UITableViewController

@property(nonatomic, retain) BlueCapPeripheral*     peripheral;
@property(nonatomic, retain) IBOutlet UIButton*     disconnectButton;
@property(nonatomic, retain) IBOutlet UILabel*      uuidLabel;
@property(nonatomic, retain) IBOutlet UILabel*      rssiLabel;

- (IBAction)disconnect:(id)sender;

@end
