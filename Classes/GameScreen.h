#ifndef __GAMESCENE_H__
#define __GAMESCENE_H__

#include "cocos2d.h"

class GameScreen : public cocos2d::Layer
{
 private:
    enum
    {
	kTagTileMap = 1,
    };

 public:
    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();

    /* virtual void ccTouchesMoved(Set * touches, Event * event); */

    // a selector callback
    void menuCloseCallback(Object* pSender);

    // implement the "static node()" method manually
    CREATE_FUNC(GameScreen);
};

#endif // __GAMESCENE_H__
