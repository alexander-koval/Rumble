    DEFINES += LINUX
    DEFINES += DEBUG
    LBITS = $$system(getconf LONG_BIT)
    RUMBLE_INCLUDE_PATH += \
        $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/linux

    LIBS += -L/usr/lib
    LIBS += -L/usr/local/lib \

    contains(LBITS,64) {
        LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries/lib64
        LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/CocosDenshion/third_party/fmod/lib64/api/lib -lfmodex64
    } else {
        LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/linux/libraries
        LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/CocosDenshion/third_party/fmod/api/lib -lfmodex
    }
    LIBS += -L$$OUT_PWD/../cocos2dx/cocos2dx \
            -L$$OUT_PWD/../cocos2dx/CocosDenshion \
            -L$$OUT_PWD/../cocos2dx/extensions \
            -L$$OUT_PWD/../cocos2dx/external/Box2D \
            -L$$OUT_PWD/../cocos2dx/external/chipmunk

    LIBS +=  -lrt -lz -lX11

    DESTDIR = $$_PRO_FILE_PWD_/../../bin
#    RESOURCE_COPY.target = .resources0
#    RESOURCE_COPY.files += $$RUMBLE_RESOURCE_PATH/fonts
#    RESOURCE_COPY.files += $$RUMBLE_RESOURCE_PATH/tilemaps
#    RESOURCE_COPY.command = $(COPY_DIR) $$RUMBLE_RESOURCE_PATH $$DESTDIR
#    QMAKE_EXTRA_TARGETS += RESOURCE_COPY
