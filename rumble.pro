TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CCFLAGS += -Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-return-type -Wno-ignored-qualifiers -Wno-type-limits -fPIC -MMD
QMAKE_CFLAGS +=  $$CCFLAGS -Wno-implicit-function-declaration -Wno-reorder
QMAKE_CXXFLAGS += $$CCFLAGS -std=c++11
QMAKE_CFLAGS_DEBUG += $$QMAKE_CFLAGS -g3 -O0
QMAKE_CXXFLAGS_DEBUG += $$QMAKE_CXXFLAGS -g3 -O0

QMAKE_LFLAGS += -Wl,--no-as-needed

RUMBLE_RESOURCE_PATH += Resources

RUMBLE_INCLUDE_PATH += \
    ../cocos2dx/cocos2dx \
    ../cocos2dx/cocos2dx/include \
    ../cocos2dx/cocos2dx/kazmath/include \
    ../cocos2dx/CocosDenshion/include

SOURCES += \
    Classes/AppDelegate.cpp \
    Classes/GameScreen.cpp \
    Classes/TMXRumbleTiledMap.cpp \
    Classes/utils/FromTiledMap.cpp \


HEADERS += \
    Classes/AppDelegate.h \
    Classes/GameScreen.h \
    Classes/TMXRumbleTiledMap.h \
    Classes/utils/FromTiledMap.h

OTHER_FILES += \
    Resources/GameScreen.png \
    Resources/CloseNormal.png \
    Resources/CloseSelected.png \
    Resources/tilemaps/bush.png \
    Resources/tilemaps/edge.png \
    Resources/tilemaps/grave1.png \
    Resources/tilemaps/rock.png \
    Resources/tilemaps/ScreenSize.png \
    Resources/tilemaps/tiles.png \
    Resources/tilemaps/tree.png \
    Resources/tilemaps/testmap.tmx \
    Resources/fonts/Marker Felt.ttf \

unix:!mac:!android {
    SOURCES += $$_PRO_FILE_PWD_/proj.linux/main.cpp
    include(proj.linux/linux.pri)
}

android {
    SOURCES += proj.android/jni/hellocpp/main.cpp
    include(proj.android/android.pri)
    OTHER_FILES += \
        proj.android/AndroidManifest.xml
}

LIBS += -ljpeg -lpng -ltiff -lwebp -lcurl  \
        -lcocos2dx -lCocosDenshion -lBox2D

INCLUDEPATH += $${RUMBLE_INCLUDE_PATH}
