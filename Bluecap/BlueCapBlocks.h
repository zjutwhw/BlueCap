//
//  BlueCapBlocks.h
//  BlueCap
//
//  Created by Troy Stribling on 9/25/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

#ifndef BlueCap_BlueCapBlocks_h
#define BlueCap_BlueCapBlocks_h

@class BlueCapPeripheral;
@class BlueCapCharacteristic;

@class BlueCapCharacteristicData;
@class BlueCapDescriptorData;

@class BlueCapCharacteristicProfile;
@class BlueCapPeripheralProfile;
@class BlueCapServiceProfile;

typedef void(^BlueCapCentralManagerCallback)(void);
typedef void(^BlueCapPeripheralCallback)(BlueCapPeripheral* __peripheral);

typedef void(^BlueCapPeripheralRSSICallback)(NSNumber* __rssi, NSError* __error);
typedef void(^BlueCapServicesDiscoveredCallback)(NSArray* _services);
typedef void(^BlueCapCharacteristicsDiscoveredCallback)(NSArray* __characteristics);
typedef void(^BlueCapDescriptorsDicoveredCallback)(NSArray* __descriptors);

typedef void(^BlueCapPeripheralProfileBlock)(BlueCapPeripheralProfile* __peripheralProfile);
typedef void(^BlueCapServiceProfileBlock)(BlueCapServiceProfile* __serviceProfile);
typedef void(^BlueCapCharacteristicProfileBlock)(BlueCapCharacteristicProfile* __characteristicProfile);

typedef void(^BlueCapCharacteristicProfileAfterDiscoveredCallback)(BlueCapCharacteristic* __characteristic);
typedef NSData*(^BlueCapCharacteristicProfileSerializeCallback)(void);
typedef NSData*(^BlueCapCharacteristicProfileSerializeWithDataCallback)(id __data);
typedef NSDictionary*(^BlueCapCharacteristicProfileDeserializeCallback)(NSData* __data);

typedef void(^BlueCapCharacteristicDataCallback)(BlueCapCharacteristicData* __data, NSError* __error);
typedef void(^BlueCapDescriptorDataCallback)(BlueCapDescriptorData* __data, NSError* __error);

#endif
