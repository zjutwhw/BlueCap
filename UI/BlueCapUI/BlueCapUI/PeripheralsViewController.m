//
//  PeriphrealsViewController.m
//  BlueCapUI
//
//  Created by Troy Stribling on 8/17/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

#import "PeripheralsViewController.h"
#import "PeripheralDetailViewController.h"
#import "PeripheralCell.h"

@interface PeripheralsViewController () {
}

- (void)reloadTableData;

@end

@implementation PeripheralsViewController

#pragma mark -
#pragma mark PeripheralsViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    BlueCapCentralManager* blueCapCentralManager = [BlueCapCentralManager sharedInstance];
    [blueCapCentralManager powerOn:^{
        [blueCapCentralManager startScanning:^(BlueCapPeripheral* __peripheral) {
            [self reloadTableData];
        }];
    } onPowerOff:^{
        [self reloadTableData];
    }];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"PeripheralDetail"]) {
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForCell:sender];
        PeripheralDetailViewController *viewController = segue.destinationViewController;
        viewController.peripheral = [[BlueCapCentralManager sharedInstance].periphreals objectAtIndex:selectedRowIndex.row];
    }
}

#pragma mark -
#pragma mark PeripheralsViewController PrivateAPI

- (void)reloadTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BlueCapCentralManager* blueCapManager = [BlueCapCentralManager sharedInstance];
    return [blueCapManager.periphreals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"PeripheralCell";
    PeripheralCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    CBPeripheral* peripheral = [[BlueCapCentralManager sharedInstance].periphreals objectAtIndex:indexPath.row];
    [cell.connectingActivityIndicator stopAnimating];
    if (peripheral.state == CBPeripheralStateDisconnected) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    cell.nameLabel.text = peripheral.name;
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    BlueCapPeripheral* peripheral = [[BlueCapCentralManager sharedInstance].periphreals objectAtIndex:indexPath.row];
    PeripheralCell* cell = (PeripheralCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell.connectingActivityIndicator startAnimating];
    if (peripheral.state == CBPeripheralStateDisconnected) {
        [peripheral connect:^(BlueCapPeripheral* __peripheral) {
            [self reloadTableData];
        }];
    } else {
        [peripheral disconnect:^(BlueCapPeripheral* __peripheral){
            [self reloadTableData];
        }];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
}

@end
