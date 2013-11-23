/** FromTiledMap.h --- 
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


#ifndef FROMTILEDMAP_H
#define FROMTILEDMAP_H 1

#include "cocos2d.h"
#include "tilemap_parallax_nodes/CCTMXTiledMap.h"
#include "tilemap_parallax_nodes/CCTMXXMLParser.h"

USING_NS_CC;

class FromTiledMap {
 public:
  static CCTMXTiledMap * parse(const char * tmxFile);
  static CCTMXTiledMap * parseFromXML(const char * tmxString, const char * resourcePath);
};

class FindTileset
{
public:
    CCTMXTilesetInfo* operator ()(CCArray* tilesets, int gid);
};

#endif // FROMTILEDMAP_H
