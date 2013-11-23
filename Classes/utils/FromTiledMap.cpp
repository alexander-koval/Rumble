#include <functional>
#include "FromTiledMap.h"
#include "tilemap_parallax_nodes/CCTMXXMLParser.h"

USING_NS_CC;

CCTMXTiledMap * FromTiledMap::parse(const char * tmxFile)
{
  std::function<CCTMXTilesetInfo * (CCArray * tilesets, int gid)> find = FindTileset();

  CCTMXTiledMap * map = CCTMXTiledMap::create(tmxFile);
  CCTMXMapInfo * mapInfo = CCTMXMapInfo::formatWithTMXFile(tmxFile);
  map->setAnchorPoint(ccp(0, 1));
  map->layerNamed("collide")->setVisible(false);

  CCTMXObjectGroup * group = map->objectGroupNamed("trees");
  CCArray* children = map->getChildren();

  CCObject * childObject = NULL;
  CCARRAY_FOREACH(children, childObject) {
    CCTMXLayer * child = static_cast<CCTMXLayer *>(childObject);
    CCLog("CHILD OF MAP, %s", child->getLayerName());
  }
  
  CCArray * objects = group->getObjects();

  CCDictionary * dict = NULL;
  CCObject * object = NULL;
  CCARRAY_FOREACH(objects, object) {
    dict = static_cast<CCDictionary *>(object);
    if (!dict) break;
    CCString * gid = static_cast<CCString *>(dict->objectForKey("gid"));

    CCTMXTilesetInfo * tileset =  find(mapInfo->getTilesets(), gid->intValue());
    CCSprite * tree = CCSprite::create(tileset->m_sSourceImage.c_str());
    tree->setAnchorPoint(ccp(0.5, 0.5));
    // tree->getOffsetPosition().x = 40;
    // tree->getOffsetPosition().y = 155;
    // tree->getContentSize().width = 40;
    // tree->getContentSize().height = 30;
    // tree->setPosition(ccp(tree->getOffsetPosition().x, tree->getOffsetPosition().y));
    map->addChild(tree);
  }
  return map;
}

CCTMXTiledMap * FromTiledMap::parseFromXML(const char * tmxString, const char * resourcePath)
{
  return NULL;
}

CCTMXTilesetInfo * FindTileset::operator ()(CCArray * tilesets, int gid) {
    CCObject * tilesetObj = NULL;
    CCARRAY_FOREACH(tilesets, tilesetObj) {
        CCTMXTilesetInfo * tileset = static_cast<CCTMXTilesetInfo *>(tilesetObj);
        if (gid == tileset->m_uFirstGid) {
            return tileset;
        }
    }
    return NULL;
}
