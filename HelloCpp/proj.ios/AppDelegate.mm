//
//  AppDelegate.m
//  MaskedCal
//
//  Created by Ray Wenderlich on 7/17/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "AppDelegate.h"
#import "CocosHelper.h"

@implementation AppDelegate

@synthesize window;

- (void) removeStartupFlicker
{
}
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    //s_sharedApplication.applicationDidFinishLaunching();
}


- (void)applicationWillResignActive:(UIApplication *)application {
    [CocosHelper applicationWillResignActive];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [CocosHelper applicationDidBecomeActive];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
    [CocosHelper applicationDidEnterBackground];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
    [CocosHelper applicationWillEnterForeground];
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
}

- (void)dealloc {
	[super dealloc];
}

@end
