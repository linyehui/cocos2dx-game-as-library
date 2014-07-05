//
//  AppDelegate.h
//  GamesHall
//
//  Created by linyehui on 14-7-5.
//  Copyright (c) 2014年 linyehui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HallViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController* navController;
@property (nonatomic, retain) HallViewController* hallController;

@end
