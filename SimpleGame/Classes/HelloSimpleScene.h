#ifndef __HelloSimple_SCENE_H__
#define __HelloSimple_SCENE_H__

#include "cocos2d.h"

//#include "SimpleAudioEngine.h"

class HelloSimple : public cocos2d::CCLayerColor
{
public:
	HelloSimple();
	~HelloSimple();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, 
    // instead of returning 'id' in cocos2d-iphone
	virtual bool init();  

	// there's no 'id' in cpp, so we recommand to return the exactly class pointer
	static cocos2d::CCScene* scene();

	// a selector callback
	virtual void menuCloseCallback(cocos2d::CCObject* pSender);

	// implement the "static node()" method manually
	CREATE_FUNC(HelloSimple);

	void spriteMoveFinished(cocos2d::CCNode* sender);

	void gameLogic(float dt);

	void updateGame(float dt);

	void registerWithTouchDispatcher();
	void ccTouchesEnded(cocos2d::CCSet* touches, cocos2d::CCEvent* event);
    
    
protected:
	cocos2d::CCArray *_targets;
	cocos2d::CCArray *_projectiles;
	int _projectilesDestroyed;

	void addTarget();


};

#endif  // __HelloSimple_SCENE_H__