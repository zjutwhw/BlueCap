//
//  BlueCapDescriptor.h
//  BlueCap
//
//  Created by Troy Stribling on 8/26/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

#import "BlueCapCommon.h"


@class BlueCapCharacteristic;
@class BlueCapDescriptorValue;
typedef void(^BlueCapDescriptorCallback)(BlueCapDescriptorValue* __descriptor, NSError* __error);

@interface BlueCapDescriptor : NSObject

@property(nonatomic, readonly) id           value;
@property(nonatomic, readonly) CBUUID*      UUID;

- (BlueCapCharacteristic*)characteristic;

- (void)read:(BlueCapDescriptorCallback)__onRead;
- (void)write:(NSData*)data onWrite:(BlueCapDescriptorCallback)__onWrite;
- (NSString*)typeStringValue;

@end
