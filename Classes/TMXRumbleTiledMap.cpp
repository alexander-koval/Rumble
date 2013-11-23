#include "TMXRumbleTiledMap.h"

USING_NS_CC;      

TMXRumbleTiledMap * TMXRumbleTiledMap::create(const char * tmxFile)
{
  TMXRumbleTiledMap * pRet = new TMXRumbleTiledMap();
  if (pRet->initWithTMXFile(tmxFile))
  {
    pRet->autorelease();
    return pRet;
  }
  CC_SAFE_DELETE(pRet);
  return NULL;
}

        
TMXRumbleTiledMap * TMXRumbleTiledMap::createWithXML(const char * tmxString, const char * resourcePath)
{
  TMXRumbleTiledMap *pRet = new TMXRumbleTiledMap();

  if (pRet->initWithXML(tmxString, resourcePath))
  {
    pRet->autorelease();
    return pRet;
  }
  CC_SAFE_DELETE(pRet);
  return NULL;
}

bool TMXRumbleTiledMap::initWithTMXFile(const char * tmxFile)
{
  CCAssert(tmxFile != NULL && strlen(tmxFile)>0, "TMXTiledMap: tmx file should not bi NULL");
  setContentSize(CCSizeZero);

  CCTMXMapInfo *mapInfo = CCTMXMapInfo::formatWithTMXFile(tmxFile);

  if (!mapInfo) {
    return false;
  }
  CCAssert( mapInfo->getTilesets()->count() != 0, "TMXTiledMap: Map not found. Please check the filename.");
  buildWithMapInfo(mapInfo);

  return true;
}

bool TMXRumbleTiledMap::initWithXML(const char * tmxString, const char * resourcePath)
{
  setContentSize(CCSizeZero);

  CCTMXMapInfo *mapInfo = CCTMXMapInfo::formatWithXML(tmxString, resourcePath);

  CCAssert( mapInfo->getTilesets()->count() != 0, "TMXTiledMap: Map not found. Please check the filename.");
  buildWithMapInfo(mapInfo);

  return true;
}

void TMXRumbleTiledMap::buildWithMapInfo(CCTMXMapInfo* mapInfo) {
  m_tMapSize = mapInfo->getMapSize();
  m_tTileSize = mapInfo->getTileSize();
  m_nMapOrientation = mapInfo->getOrientation();

  CC_SAFE_RELEASE(m_pObjectGroups);
  m_pObjectGroups = mapInfo->getObjectGroups();
  CC_SAFE_RETAIN(m_pObjectGroups);

  CC_SAFE_RELEASE(m_pProperties);
  m_pProperties = mapInfo->getProperties();
  CC_SAFE_RETAIN(m_pProperties);

  CC_SAFE_RELEASE(m_pTileProperties);
  m_pTileProperties = mapInfo->getTileProperties();
  CC_SAFE_RETAIN(m_pTileProperties);

  int idx=0;

  CCArray* layers = mapInfo->getLayers();
  if (layers && layers->count()>0)
  {
    CCTMXLayerInfo* layerInfo = NULL;
    CCObject* pObj = NULL;
    CCARRAY_FOREACH(layers, pObj)
    {
      layerInfo = (CCTMXLayerInfo*)pObj;
      if (layerInfo && layerInfo->m_bVisible)
      {
        CCTMXLayer *child = parseLayer(layerInfo, mapInfo);
        addChild((CCNode*)child, idx, idx);

        // update content size with the max size
        const CCSize& childSize = child->getContentSize();
        CCSize currentSize = this->getContentSize();
        currentSize.width = MAX( currentSize.width, childSize.width );
        currentSize.height = MAX( currentSize.height, childSize.height );
        this->setContentSize(currentSize);

        idx++;
      }
    }
  }
}

CCTMXLayer * TMXRumbleTiledMap::parseLayer(CCTMXLayerInfo *layerInfo, CCTMXMapInfo *mapInfo)
{
//  CCTMXTilesetInfo *tileset = tilesetForLayer(layerInfo, mapInfo);
//  CCTMXLayer *layer = CCTMXLayer::create(tileset, layerInfo, mapInfo);

  // tell the layerinfo to release the ownership of the tiles map.
//  layerInfo->m_bOwnTiles = false;
//  layer->setupTiles();

  return NULL;
}



