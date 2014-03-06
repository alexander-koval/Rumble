/** TMXRumbleTiledMap.h --- 
 *
 * Copyright (C) 2013 
 *
 * Author:  <alexander@skinkat>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see http://www.gnu.org/licenses/.
 */


#ifndef TMXRUMBLETILEDMAP_H
#define TMXRUMBLETILEDMAP_H 1

#include "cocos2d.h"

USING_NS_CC;

class TMXRumbleTiledMap : public CCTMXTiledMap {
public:
  static TMXRumbleTiledMap * create(const char * tmxFile);

  static TMXRumbleTiledMap * createWithXML(const char * tmxString, const char * resourcePath);
  
  bool initWithTMXFile(const char * tmxFile);

  bool initWithXML(const char * tmxString, const char * resourcePath);

private:
  void buildWithMapInfo(CCTMXMapInfo* mapInfo);
  CCTMXLayer * parseLayer(CCTMXLayerInfo * layerInfo, CCTMXMapInfo * mapInfo);
};

#endif // TMXRUMBLETILEDMAP_H
