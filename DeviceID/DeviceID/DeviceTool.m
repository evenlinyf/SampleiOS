//
//  DeviceTool.m
//  DeviceID
//
//  Created by EvenLin on 2019/6/26.
//  Copyright © 2019 evenlin. All rights reserved.
//

#import "DeviceTool.h"
@import UIKit;
@import AdSupport;

@implementation DeviceTool


/**
 UUID
 - 卸载所有符合 com.evenlin.* 的app重装后值会变化
 */
+ (NSString *)vendorUUID {
    NSString *uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
    return uuid;
}



/**
 每次创建都是不同的唯一串， 需要保存到keychain
 */
+ (NSString *)createUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}


/**
 广告标识符
 - 设置 - 隐私 - 广告
 - 还原广告标识符后值会变化
 - 限制广告追踪开启后，获取到的值会变成0000....
 - 限制广告追踪开启重新关闭后， 值会变化
 */
+ (NSString *)advertisingID {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

+ (NSString *)bundelID {
    return [[NSBundle mainBundle] bundleIdentifier];
}

@end
