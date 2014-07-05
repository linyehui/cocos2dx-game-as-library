//
//  CocosHelper.m
//  HelloCpp
//
//  Created by linyehui on 14-7-5.
//
//

#import "SimpleCocosHelper.h"


#import "cocos2d.h"
#import "EAGLView.h"
#import "CocosAppDelegate.h"

#import "HelloSimpleScene.h"

@implementation SimpleCocosHelper

// cocos2d application instance
// 两个游戏加到一个工程的时候只能保留一个，否则会从Cocos内部直接异常退出
//static CocosAppDelegate s_sharedApplication2;

+ (void)setupCocos:(UIView *)view
{
    EAGLView *__glView = [EAGLView viewWithFrame: [view bounds]
                                     pixelFormat: kEAGLColorFormatRGBA8
                                     depthFormat: GL_DEPTH_COMPONENT16
                              preserveBackbuffer: NO
                                      sharegroup:nil
                                   multiSampling:NO
                                 numberOfSamples:0];
    
    [view addSubview:__glView];
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
    cocos2d::CCApplication::sharedApplication()->run();
    
    cocos2d::CCScene *pScene = HelloSimple::scene();
    cocos2d::CCDirector::sharedDirector()->runWithScene(pScene);
}

+ (void)applicationWillResignActive
{
    cocos2d::CCDirector::sharedDirector()->pause();
}

+ (void)applicationDidBecomeActive
{
    cocos2d::CCDirector::sharedDirector()->resume();
}

+ (void)applicationDidEnterBackground
{
    cocos2d::CCApplication::sharedApplication()->applicationDidEnterBackground();
}

+ (void)applicationWillEnterForeground
{
    cocos2d::CCApplication::sharedApplication()->applicationWillEnterForeground();
}

@end
