//
//  CocosHelper.h
//  HelloCpp
//
//  Created by linyehui on 14-7-5.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CocosHelper : NSObject

+ (void)setupCocos:(UIView *)view;

+ (void)applicationWillResignActive;
+ (void)applicationDidBecomeActive;
+ (void)applicationDidEnterBackground;
+ (void)applicationWillEnterForeground;

@end
