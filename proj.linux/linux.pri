DEFINES += LINUX
DEFINES += DEBUG
LBITS = $$system(getconf LONG_BIT)

RUMBLE_INCLUDE_PATH += \
    /usr/lib \
    /usr/local/lib \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/linux \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libjpeg \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libpng \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libtiff/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libwebp \

LIBS += -L/usr/lib
LIBS += -L/usr/local/lib \

contains(LBITS,64) {
    STATICLIBS_DIR = $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries/lib64
    LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries/lib64
    LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/CocosDenshion/third_party/fmod/lib64/api/lib -lfmodex64
} else {
    STATICLIBS_DIR = $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries
    LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries
    LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/CocosDenshion/third_party/fmod/api/lib -lfmodex
    LIBS += $$STATICLIBS_DIR/libpng15.a
}

LIBS += \
    $$STATICLIBS_DIR/libcurl.a \
    $$STATICLIBS_DIR/libfreetype.a \
    $$STATICLIBS_DIR/libjpeg.a \
    $$STATICLIBS_DIR/libpng.a \
    $$STATICLIBS_DIR/libtiff.a \
    $$STATICLIBS_DIR/libwebp.a

LIBS += -L$$OUT_PWD/../cocos2dx/cocos2dx \
        -L$$OUT_PWD/../cocos2dx/CocosDenshion \
        -L$$OUT_PWD/../cocos2dx/extensions \
        -L$$OUT_PWD/../cocos2dx/external/Box2D \
        -L$$OUT_PWD/../cocos2dx/external/chipmunk

LIBS +=  -lrt -lz -lX11 -lGL -lglfw2 -lGLEW -lfreetype -lfontconfig -lpthread -ljpeg -lpng -ltiff -ljpeg -lpng -ltiff -lwebp -lcurl

DESTDIR = $$_PRO_FILE_PWD_/../../bin/linux
#    RESOURCE_COPY.target = .resources0
#    RESOURCE_COPY.files += $$RUMBLE_RESOURCE_PATH/fonts
#    RESOURCE_COPY.files += $$RUMBLE_RESOURCE_PATH/tilemaps
#    RESOURCE_COPY.command = $(COPY_DIR) $$RUMBLE_RESOURCE_PATH $$DESTDIR
#    QMAKE_EXTRA_TARGETS += RESOURCE_COPY
