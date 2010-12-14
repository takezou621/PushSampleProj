//
//  PushSampleProjAppDelegate.h
//  PushSampleProj
//
//  Created by jp10123 on 10/12/14.
//  Copyright 2010 NHN Japan Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushSampleProjAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIBackgroundTaskIdentifier *bgTask;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

