#include "GameScreen.h"

USING_NS_CC;

// on "init" you need to initialize your instance
bool GameScreen::init()
{
  //////////////////////////////
  // 1. super init first
  if ( !Layer::init() )
    {
      return false;
    }

  Size visibleSize = Director::getInstance()->getVisibleSize();
  Point origin = Director::getInstance()->getVisibleOrigin();

  /////////////////////////////
  // 2. add a menu item with "X" image, which is clicked to quit the program
  //    you may modify it.

  // add a "close" icon to exit the progress. it's an autorelease object
  MenuItemImage *closeItem = MenuItemImage::create(
						   "CloseNormal.png",
						   "CloseSelected.png",
						   CC_CALLBACK_1(GameScreen::menuCloseCallback, this));

  closeItem->setPosition(Point(origin.x + visibleSize.width - closeItem->getContentSize().width/2 ,
			       origin.y + closeItem->getContentSize().height/2));

  TMXTiledMap * map = TMXTiledMap::create("tilemaps/testmap.tmx");
  addChild(map, 0, kTagTileMap);

  Size CC_UNUSED s = map->getContentSize();
  CCLOG("ContentSize: %f, %f", s.width, s.height);

  // Array * pChildArray = map->getChildren();
  // SpriteBatchNode * child = NULL;
  // Object * pObject = NULL;
  // CCARRAY_FOREACH(pChildArray, pObject)
  //   {
  //     child = static_cast<SpriteBatchNode *>(pObject);
  //     if (!child) break;
  //     child->getTexture()->setAntiAliasTexParameters();
  //   }
  // // map->runAction(ScaleBy::create(2, 0.1f));
  // //    TMXLayer * layer = map->getLayer("background");

  float x, y, z;
  map->setAnchorPoint(Point(0.5f, 0.5f));
  map->getCamera()->getEyeXYZ(&x, &y, &z);
  // map->getCamera()->setEyeXYZ(x + s.height / 2, y, z - s.width / 2);

  map->setPosition(Point(0, 0));

  CCLOG("X, Y, Z Coordinates: %f, %f, %f", x, y, z);
  Size CC_UNUSED bounds = map->getBoundingBox().size;
  CCLOG("Bounding Box Size: %f, %f", bounds.width, bounds.height);

  return true;
}

void GameScreen::ccTouchesBegan(Set * touches, Event * event)
{
  CCLOG("TOUCH BEGAN");
}

void GameScreen::ccTouchesMoved(Set * touches, Event * event)
{
  CCLOG("TOUCH MOVING");
  Touch * touch = static_cast<Touch *>(touches->anyObject());
  Point diff = touch->getDelta();
  Node * node = getChildByTag(kTagTileMap);
  Point current = node->getPosition();
  node->setPosition(current + diff);
}


void GameScreen::menuCloseCallback(Object* pSender)
{
  Director::getInstance()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
  exit(0);
#endif
}

#define COCOS2D_DEBUG 1
