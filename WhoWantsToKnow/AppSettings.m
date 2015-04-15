//
//  AppSettings.m
//  WhoWantsToKnow
//
//  Created by TYLER on 4/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppSettings.h"

@implementation AppSettings

+ (AppSettings *)sharedInstance {
    static AppSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppSettings alloc] init];
        
        [sharedInstance registerForNotifications];
    });
    return sharedInstance;
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToViewAppeared:) name:viewAppearedNotificationKey object:nil];
}

- (void)respondToViewAppeared:(NSNotification *)notification {
    NSLog(@"View Appeared. It's magic.");
}

- (void) unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:viewAppearedNotificationKey object:nil] ;
}

- (void)dealloc {
    [self unregisterForNotifications];
}

@end
