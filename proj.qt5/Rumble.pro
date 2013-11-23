TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

QMAKE_CXXFLAGS += -std=c++0x

CONFIG(debug, debug|release) {
DESTDIR = bin/debug/
}

CONFIG(release, debug|release) {
DESTDIR = bin/release/
}


RESOURCES = Resources.qrc


SOURCES += main.cpp \
        ../Classes/AppDelegate.cpp	\
    ../Classes/TMXRumbleTiledMap.cpp \
    ../Classes/GameScreen.cpp \
    ../Classes/utils/FromTiledMap.cpp

HEADERS += main.h \
        ../Classes/AppDelegate.h \
    ../Classes/TMXRumbleTiledMap.h \
    ../Classes/GameScreen.h \
    ../Classes/utils/FromTiledMap.h

# set a variable for config cocos2dx modules
# --------------------------------------------
# the simple audio engine
COCOS2D-X_MODULES += CocosDenshion
# some extensions eg: CCTableView
COCOS2D-X_MODULES += extensions
# the box2d physics engine
COCOS2D-X_MODULES += box2d
# the chipmunk physics engine
# COCOS2D-X_MODULES += chipmunk
# --------------------------------------------

COCOS2D_ROOT = $$system(echo $COCOS_ROOT)

# set include path and depend path
COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/cocos2dx \
	$$COCOS2D_ROOT/cocos2dx/include \
	$$COCOS2D_ROOT/cocos2dx/cocoa \
	$$COCOS2D_ROOT/cocos2dx/kazmath/include \
	$$COCOS2D_ROOT/cocos2dx/platform

contains(COCOS2D-X_MODULES,CocosDenshion) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/CocosDenshion/include
}

contains(COCOS2D-X_MODULES,extensions) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/extensions
}

contains(COCOS2D-X_MODULES,box2d) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/external
}

contains(COCOS2D-X_MODULES,chipmunk) {
	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/external/chipmunk/include/chipmunk
}

#set the platform depended include and depend path
unix:!macx {
	DEFINES += LINUX

	COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/cocos2dx/platform/linux
		
	LBITS = $$system(getconf LONG_BIT)

        contains(LBITS,64) {
		COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/platform/third_party/linux/include64
		STATICLIBS_DIR += $$COCOS2D_ROOT/cocos2dx/platform/third_party/linux/libraries/lib64
		contains(COCOS2D-X_MODULES,CocosDenshion) {
			SHAREDLIBS_DIR += $$COCOS2D_ROOT/CocosDenshion/third_party/fmod/lib64/api/lib
			SHAREDLIBS += -L$$SHAREDLIBS_DIR -lfmodex64
		}

	} else {
		COCOS_INCLUDE_DEPEND_PATH += $$COCOS2D_ROOT/platform/third_party/linux
		STATICLIBS_DIR += $$COCOS2D_ROOT/cocos2dx/platform/third_party/linux/libraries
		contains(COCOS2D-X_MODULES,CocosDenshion) {
			SHAREDLIBS_DIR += $$COCOS2D_ROOT/CocosDenshion/third_party/fmod/api/lib
			SHAREDLIBS += -L$$SHAREDLIBS_DIR -lfmodex
		}
	}

#	contains(CONFIG,debug) {
#	DEFINES += DEBUG

#	SHAREDLIBS += -L$$COCOS2D_ROOT/lib/linux/Debug -Wl,-rpath,$$COCOS2D_ROOT/lib/linux/Debug
#
#	contains(COCOS2D-X_MODULES,box2d) {
#		STATICLIBS += $$COCOS2D_ROOT/lib/linux/Debug/libbox2d.a
#	}
#	contains(COCOS2D-X_MODULES,chipmunk) {
#		STATICLIBS += $$COCOS2D_ROOT/lib/linux/Debug/libchipmunk.a
#	}
#} else {
		DEFINES += NDEBUG

                SHAREDLIBS += -L$$COCOS2D_ROOT/lib/linux/release -Wl,-rpath,$$COCOS2D_ROOT/lib/linux/release

		contains(COCOS2D-X_MODULES,box2d) {
                        STATICLIBS += $$COCOS2D_ROOT/lib/linux/release/libbox2d.a
		}
		contains(COCOS2D-X_MODULES,chipmunk) {
                        STATICLIBS += $$COCOS2D_ROOT/lib/linux/release/libchipmunk.a
		}
#	}

	SHAREDLIBS += -lcocos2d -lrt -lz
        SHAREDLIBS += -lfreetype -lxml2 -lpng -ltiff -lcurl -lGL -lGLEW

	contains(COCOS2D-X_MODULES,CocosDenshion) {
		SHAREDLIBS += -lcocosdenshion
	}

	SHAREDLIBS += -Wl,-rpath,$${SHAREDLIBS_DIR}
	SHAREDLIBS += -Wl,-rpath,$$STATICLIBS_DIR

	LIBS +=	$${STATICLIBS}
	LIBS += $${SHAREDLIBS}
} 
	
INCLUDEPATH += $${COCOS_INCLUDE_DEPEND_PATH}
DEPENDPATH += $${COCOS_INCLUDE_DEPEND_PATH}


