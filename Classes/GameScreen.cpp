#include "GameScreen.h"

USING_NS_CC;

// on "init" you need to initialize your instance
bool GameScreen::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }

    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCPoint origin = CCDirector::sharedDirector()->getVisibleOrigin();

    map = FromTiledMap::parse("tilemaps/testmap.tmx");
//    map = CCTMXTiledMap::create("tilemaps/testmap.tmx");
    addChild(map, 0, kTagTileMap);

    CCSize CC_UNUSED s = map->getContentSize();
    CCLog("ContentSize: %f, %f", s.width, s.height);

    CCCamera * camera = map->getCamera();

    float x, y, z;
    // map->setAnchorPoint(CCPoint(0, 1));
    map->getCamera()->getEyeXYZ(&x, &y, &z);
    
    map->getCamera()->locate();
    
//    map->getCamera()->setUpXYZ(1, 14, 1);
    // map->layerNamed("collide")->setVisible(false);
    // // map->getCamera()->setEyeXYZ(x + s.height / 2, y, z - s.width / 2);
    // //    map->getLayer("collide")->setVisible(false);

    // CCTMXObjectGroup * group = map->objectGroupNamed("trees");
    // CCArray * objects = group->getObjects();

    // CCDictionary * dict = NULL;
    // CCObject * pObj = NULL;

    // CCARRAY_FOREACH(objects, pObj)
    // {
    //     dict = static_cast<CCDictionary *>(pObj);
    //     if (!dict) break;
    //     CCObject * o = NULL;
    //     // CCARRAY_FOREACH(dict->allKeys(), o) {
    //     //     CCString * s = static_cast<CCString *>(o);
    //     //     CCLog("obj %s", s->getCString());
    //     // }
        
    //     CCString * obj = static_cast<CCString *>(dict->objectForKey("gid"));
    //     CCString * type = static_cast<CCString *>(dict->objectForKey("width"));
    //     CCLog("GID: %s", type->getCString());
    // }

    map->setPosition(CCPoint(0, 0 + visibleSize.height));


    //    CCLOG("X, Y, Z Coordinates: %f, %f, %f", x, y, z);
    CCSize CC_UNUSED bounds = map->boundingBox().size;
    CCLOG("Bounding Box Size: %f, %f", bounds.width, bounds.height);

    setTouchEnabled(true);


    // setTouchMode(Touch::DispatchMode::ONE_BY_ONE);

    // CCLOG("INITIALIZATION COMPLETE. TouchMode: %s", Layer::getTouchMode());

    return true;
}

// void GameScreen::ccTouchesBegan(Set * touches, Event * event)
// {
//     CCLOG("TOUCHES BEGAN");
// }

void GameScreen::ccTouchesMoved(CCSet * touches, CCEvent * event) {
    CCLOG("TOUCHES MOVING");
    CCSize visibleSize = CCDirector::sharedDirector()->getVisibleSize();
    CCSize CC_UNUSED bounds = map->boundingBox().size;
    CCTouch * touch = static_cast<CCTouch *>(touches->anyObject());
    CCPoint diff = touch->getDelta();
    CCNode * node = getChildByTag(kTagTileMap);
    CCPoint current = node->getPosition();
    CCPoint next = current + diff;

    if (next.x < 0 && next.y > visibleSize.height &&
	next.x > -bounds.width && next.y < bounds.height - visibleSize.height)
    {
        node->setPosition(current + diff);
    }

    CCLOG("X, Y Coordinates: %f, %f", current.x, current.y);
}

// bool GameScreen::ccTouchBegan(Touch * touch, Event * event)
// {
//     CCLOG("TOUCH BEGAN");
// }

void GameScreen::menuCloseCallback(CCObject* pSender)
{
    CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}

#define COCOS2D_DEBUG 1
