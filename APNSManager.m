//
//  APNSManager.m
//  TapVideoPlayer
//
//  Created by Super-mac on 16/8/5.
//  Copyright © 2016年 tongbuwanglou. All rights reserved.
//

#import "APNSManager.h"

@implementation APNSManager

+ (instancetype)sharedManager
{
    static id manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (void)remoteNotification:(NSDictionary *)launchOptions
{
    
    [self registerNotification];
    
    NSDictionary *userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if (userInfo) {
        [self addMessageFromRemoteNotification:userInfo updateUI:YES];
    }
}

- (void)registerNotification
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)]) {
        UIUserNotificationType types = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert;;
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:types
                                                                                                              categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        UIRemoteNotificationType types = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    }
    
    [[UIApplication sharedApplication]  setApplicationIconBadgeNumber:0];
}

- (void)unregisterNotification
{
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
}

@end
