//
//  HallViewController.h
//  GamesHall
//
//  Created by linyehui on 14-7-5.
//  Copyright (c) 2014年 linyehui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class SimpleGameRootViewController;

@interface HallViewController : UIViewController
{
    RootViewController *_rootViewController;
    SimpleGameRootViewController *_smrootViewController;
}

@property (retain) IBOutlet RootViewController *rootViewController;
@property (retain) IBOutlet SimpleGameRootViewController *smrootViewController;

@end
