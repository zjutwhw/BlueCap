//
//  BlueCapDescriptor+Friend.m
//  BlueCap
//
//  Created by Troy Stribling on 8/31/13.
//  Copyright (c) 2013 gnos.us. All rights reserved.
//

#import "BlueCapDescriptor+Friend.h"
#import "BlueCapCentralManager+Friend.h"
#import "BlueCapDescriptorData+Friend.h"

@implementation BlueCapDescriptor (Friend)

@dynamic cbDescriptor;
@dynamic characteristic;
@dynamic onWriteCallback;
@dynamic onReadCallback;

+ (BlueCapDescriptor*)withCBDiscriptor:(CBDescriptor*)__descriptor andChracteristic:(BlueCapCharacteristic*)__chracteristic {
    return [[BlueCapDescriptor alloc] initWithCBDiscriptor:__descriptor andChracteristic:__chracteristic];
}

- (id)initWithCBDiscriptor:(CBDescriptor*)__descriptor andChracteristic:(BlueCapCharacteristic*)__chracteristic {
    self = [super init];
    if (self) {
        self.cbDescriptor = __descriptor;
        self.characteristic = __chracteristic;
    }
    return self;
}

- (void)didUpdateValue:(NSError*)error {
    if (self.onReadCallback != nil) {
        [[BlueCapCentralManager sharedInstance] asyncCallback:^{
            self.onReadCallback([BlueCapDescriptorData withDescriptor:self], error);
        }];
    }
}

- (void)didWriteValue:(NSError*)error{
    if (self.onWriteCallback != nil) {
        [[BlueCapCentralManager sharedInstance] asyncCallback:^{
            self.onWriteCallback([BlueCapDescriptorData withDescriptor:self], error);
        }];
    }
}

@end
