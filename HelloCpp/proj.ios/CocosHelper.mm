//
//  CocosHelper.m
//  HelloCpp
//
//  Created by linyehui on 14-7-5.
//
//

#import "CocosHelper.h"


#import "cocos2d.h"
#import "EAGLView.h"
#import "CocosAppDelegate.h"

#import "HelloWorldScene.h"

@implementation CocosHelper

// cocos2d application instance
static CocosAppDelegate s_sharedApplication;

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
    
    // create a scene. it's an autorelease object
    
    cocos2d::CCDirector *pDirector = cocos2d::CCDirector::sharedDirector();
    cocos2d::CCScene *pScene = HelloWorld::scene();
    pDirector->runWithScene(pScene);

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
