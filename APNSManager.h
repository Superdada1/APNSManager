//
//  APNSManager.h
//  TapVideoPlayer
//
//  Created by Super-mac on 16/8/5.
//  Copyright © 2016年 tongbuwanglou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APNSManager : NSObject

+ (instancetype)sharedManager;

- (void)remoteNotification:(NSDictionary *)launchOptions;
- (void)registerNotification;
- (void)unregisterNotification;

@end
