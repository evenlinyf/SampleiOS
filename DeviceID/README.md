# 设备唯一标识

|ID|特性|
|---|---|
|VendorID|卸载所有符合 com.evenlin.* 的app重装后值会变化|
|CFUUID|每次创建都是不同的唯一串， 需要保存到keychain,才能当成唯一标识|
|AdvertisingID|广告标识符，设置 - 隐私 - 广告; 1. 还原广告标识符后值会变化；2. 限制广告追踪开启后，获取到的值会变成0000....; 3.限制广告追踪开启重新关闭后， 值会变化|


## vendorID

```objc
+ (NSString *)vendorUUID {
    NSString *uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
    return uuid;
}
```

## CFUUID
```objc
+ (NSString *)createUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
```

## AdvertisingID
```
+ (NSString *)advertisingID {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}
```