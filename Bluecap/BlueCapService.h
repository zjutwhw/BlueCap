//
//  BlueCapService.h
//  BlueCap
//
//  Created by Troy Stribling on 8/24/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

@class BlueCapPeripheral;
@class BlueCapService;
@class BlueCapCharacteristic;

typedef void(^BlueCapCharacteristicsDiscoveredCallback)(NSArray* __discoveredCharacteristics);

@interface BlueCapService : NSObject

@property(nonatomic, readonly) CBUUID*                      UUID;
@property(nonatomic, readonly) NSArray*                     characteristics;
@property(nonatomic, readonly) NSArray*                     includedServices;
@property(nonatomic, readonly) BOOL                         isPrimary;
@property(nonatomic, readonly) BlueCapPeripheral*           peripheral;

+ (BlueCapService*)withCBService:(CBService*)__cbservice andPeripheral:(BlueCapPeripheral*)__peripheral;

- (void)discoverAllCharacteritics:(BlueCapCharacteristicsDiscoveredCallback)__onChracteristicsDiscoveredCallback;
- (void)discoverCharacteristics:(NSArray*)__characteristics onDiscovery:(BlueCapCharacteristicsDiscoveredCallback)__onChracteristicsDiscoveredCallback;

@end
