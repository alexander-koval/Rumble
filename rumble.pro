TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CC = clang
QMAKE_CXX = clang++

QMAKE_CXXFLAGS = -std=c++11 -Wall -g3 -O0 -Wno-ignored-qualifiers -fPIC -MMD
QMAKE_CFLAGS = -Wall -g3 -O0 -Wno-ignored-qualifiers -fPIC -MMD

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

unix:!mac:!android {
    DEFINES += LINUX
    DEFINES += DEBUG
    LBITS = $$system(getconf LONG_BIT)
    RUMBLE_INCLUDE_PATH += \
        ../cocos2dx/cocos2dx/platform/linux

    message(LINUX)
    SOURCES += proj.linux/main.cpp

    LIBS += -L/usr/lib
    LIBS += -L/usr/local/lib \

    contains(LBITS,64) {
        LIBS += -L$$PWD/../cocos2dx/cocos2dx/platform/third_party/linux/libraries/lib64
        LIBS += -L$$PWD/../cocos2dx/CocosDenshion/third_party/fmod/lib64/api/lib -lfmodex64
    } else {
        LIBS += -L$$PWD/../cocos2dx/cocos2dx/platform/third_party/linux/libraries
        LIBS += -L$$PWD/../cocos2dx/CocosDenshion/third_party/fmod/api/lib -lfmodex
    }
    LIBS += -L$$OUT_PWD/../cocos2dx/cocos2dx \
            -L$$OUT_PWD/../cocos2dx/CocosDenshion \
            -L$$OUT_PWD/../cocos2dx/extensions \
            -L$$OUT_PWD/../cocos2dx/external/Box2D \
            -L$$OUT_PWD/../cocos2dx/external/chipmunk

    LIBS +=  -lrt -lz -lX11
}

android {
    message(ANDROID)
    RUMBLE_INCLUDE_PATH += \
        ../cocos2dx/cocos2dx/platform/android

}

LIBS += -lGL -lglfw2 -lGLEW -lcurl -lfreetype -lfontconfig \
         -ljpeg -lpng -ltiff -lwebp -lpthread \
         -lcocos2dx -lCocosDenshion -lBox2D
INCLUDEPATH += $${RUMBLE_INCLUDE_PATH}
