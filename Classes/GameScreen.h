#ifndef __GAMESCENE_H__
#define __GAMESCENE_H__

#include "cocos2d.h"
#include "tilemap_parallax_nodes/CCTMXTiledMap.h"
#include "utils/FromTiledMap.h"

USING_NS_CC;

class GameScreen : public CCLayer
{
 private:
    enum
    {
	kTagTileMap = 1
    };

    CCTMXTiledMap* map;

 public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();

    /* virtual void ccTouchesBegan(Set * touches, Event * event); */

    virtual void ccTouchesMoved(CCSet * touches, CCEvent * event);
    
    /* virtual bool ccTouchBegan(Touch * touch, Event * event); */
    // a selector callback
    void menuCloseCallback(CCObject* pSender);

    // implement the "static node()" method manually
    CREATE_FUNC(GameScreen);
};

#endif // __GAMESCENE_H__
