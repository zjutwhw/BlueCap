//
//  BlueCapService.m
//  BlueCap
//
//  Created by Troy Stribling on 8/24/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//


#import "BlueCapPeripheral+Friend.h"
#import "BlueCapService.h"
#import "BlueCapCharacteristicProfile+Friend.h"

@interface BlueCapService ()

@property(nonatomic, retain) CBService*                                 cbService;
@property(nonatomic, retain) NSMutableArray*                            discoveredCharacteristics;
@property(nonatomic, retain) NSMutableDictionary*                       characteristicProfiles;
@property(nonatomic, retain) NSMutableArray*                            discoveredIncludedServices;
@property(nonatomic, retain) BlueCapPeripheral*                         peripheral;
@property(nonatomic, retain) BlueCapServiceProfile*                     profile;
@property(nonatomic, copy) BlueCapCharacteristicsDiscoveredCallback     onChracteristicsDiscoveredCallback;

@end

@implementation BlueCapService

#pragma mark -
#pragma mark BlueCapService

- (CBUUID*)UUID {
    return self.cbService.UUID;
}

- (NSArray*)characteristics {
    return [NSArray arrayWithArray:self.discoveredCharacteristics];
}

- (NSArray*)includedServices {
    return [NSArray arrayWithArray:self.discoveredIncludedServices];
}

- (BOOL)isPrimary {
    return self.cbService.isPrimary;
}

- (BlueCapPeripheral*)peripheral {
    return _peripheral;
}

- (BlueCapServiceProfile*)profile {
    return _profile;
}

- (BOOL)hasProfile {
    return self.profile != nil;
}

#pragma mark -
#pragma mark Discover Characteritics

- (void)discoverAllCharacteritics:(BlueCapCharacteristicsDiscoveredCallback)__onChracteristicsDiscoveredCallback {
    self.onChracteristicsDiscoveredCallback = __onChracteristicsDiscoveredCallback;
    [self.peripheral.cbPeripheral discoverCharacteristics:nil forService:self.cbService];
}

- (void)discoverCharacteristics:(NSArray*)__characteristics onDiscovery:(BlueCapCharacteristicsDiscoveredCallback)__onChracteristicsDiscoveredCallback {
    self.onChracteristicsDiscoveredCallback = __onChracteristicsDiscoveredCallback;
    [self.peripheral.cbPeripheral discoverCharacteristics:__characteristics forService:self.cbService];
}

#pragma mark -
#pragma mark BlueCapService PrivateAPI

@end
