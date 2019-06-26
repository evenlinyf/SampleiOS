//
//  DeviceTool.h
//  DeviceID
//
//  Created by EvenLin on 2019/6/26.
//  Copyright © 2019 evenlin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceTool : NSObject

+ (NSString *)bundelID;
+ (NSString *)vendorUUID;
+ (NSString *)createUUID;
+ (NSString *)advertisingID;

@end

NS_ASSUME_NONNULL_END
