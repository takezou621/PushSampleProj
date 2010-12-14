//
//  PushSampleProjAppDelegate.m
//  PushSampleProj
//
//  Created by jp10123 on 10/12/14.
//  Copyright 2010 NHN Japan Corporation. All rights reserved.
//

#import "PushSampleProjAppDelegate.h"

@implementation PushSampleProjAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	self.window = [[UIWindow alloc] initWithFrame:screenBounds];
    self.window.backgroundColor = [UIColor redColor];
	
    [self.window makeKeyAndVisible];
    
    return YES;
}
/*
-(void)scheduleNotificationWithItem:(ToDoItem *)item interval:(int)minuteBefore
{
	NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	NSDateComponents *dateComps = [[NSDateComponents alloc] init];
	[dateComps setDay:item.day];
	[dateComps setMonth:item.month];
	[dateComps setYear:item.year];
	[dateComps setHour:item.hour];
	[dateComps setMinute:item.minute];
	NSDate *itemDate = [calendar dateFromComponents:dateComps];
	[dateComps release];
	
	UILocalNotification *localNotif = [[UILocalNotification alloc] init];
	if (localNotif == nil) {
		return;
	}
	
	localNotif.fireDate = [itemDate addTimeInterval:-(minuteBefore*60)];
	localNotif.timeZone = [NSTimeZone defaultTimeZone];
	localNotif.alterBody = [NSString stringWithFormat:NSLocalizedString(@"%@ in %i minutes.",nil),item.eventName, minutesBefore];
	localNotif.alterAction = NSLocalizedString(@"View Details",nil);
	localNotif.soundName = UILocalNotificationDefaultSoundName;
	localNotif.applicationIconBadgeNumber = 1;
	
	NSDictionary *infoDict = [NSDictionary dictionaryWithObject:item.eventName forKey:ToDoItemKey];
	localNotif.userInfo = infoDict;
	
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
	[localNotif release];
}
 
 */

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	NSAssert(self->bgTask == UIInvalidBackgroundTask,nil);
	
	bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
		dispatch_async(dispatch_get_main_queue(),^{
			[application endBackgroundTask:bgTask];
			self->bgTask = UIInvalidBackgroundTask;
		});
	}];
	
	dispatch_async(dispatch_get_main_queue(), ^{
		while ([application backgroundTimeRemaining] > 1.0) {
			// バックグラウンドに必要な処理をおこなう			
		}
		[application endBackgroundTask:self->bgTask];
		self->bgTask = UIInvalidBackgroundTask;
	});
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
