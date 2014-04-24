DEFINES += ANDROID
DEFINES += DEBUG
ANDROID_NDK = $$system(printenv ANDROID_NDK)
QMAKE_LFLAGS += -fuse-ld=bfd -Wl,--fix-cortex-a8

RUMBLE_INCLUDE_PATH += \
    $$ANDROID_NDK/platforms/android-19/arch-arm/usr/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/android \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libcurl/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libjpeg/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libpng/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libtiff/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libwebp/include \
    $$_PRO_FILE_PWD_/../cocos2dx/external/libwebsockets/android/include

STATICLIBS_DIR = $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt
WEBSOCKETS_DIR = $$_PRO_FILE_PWD_/../cocos2dx/external/libwebsockets/android/lib/armeabi-v7a

LIBS += -L$$STATICLIBS_DIR/libcurl/libs/armeabi-v7a \
        -L$$STATICLIBS_DIR/libjpeg/libs/armeabi-v7a \
        -L$$STATICLIBS_DIR/libpng/libs/armeabi-v7a  \
        -L$$STATICLIBS_DIR/libtiff/libs/armeabi-v7a \
        -L$$STATICLIBS_DIR/libwebp/libs/armeabi-v7a \
        -L$$WEBSOCKETS_DIR

LIBS += -L$$ANDROID_NDK/platforms/android-19/arch-arm/lib

LIBS += -L$$OUT_PWD/../cocos2dx/cocos2dx \
        -L$$OUT_PWD/../cocos2dx/CocosDenshion \
        -L$$OUT_PWD/../cocos2dx/extensions \
        -L$$OUT_PWD/../cocos2dx/external/Box2D \
        -L$$OUT_PWD/../cocos2dx/external/chipmunk

#LIBS += -Wl,-Bstatic $$STATICLIBS_DIR/libcurl/libs/armeabi-v7a/libcurl.a \
#        $$STATICLIBS_DIR/libjpeg/libs/armeabi-v7a/libjpeg.a \
#        $$STATICLIBS_DIR/libpng/libs/armeabi-v7a/libpng.a \
#        $$STATICLIBS_DIR/libtiff/libs/armeabi-v7a/libtiff.a \
#        $$STATICLIBS_DIR/libwebp/libs/armeabi-v7a/libwebp.a \
#        $$WEBSOCKETS_DIR/libwebsockets.a

#PRE_TARGETDEPS += $$STATICLIBS_DIR/libcurl/libs/armeabi-v7a/libcurl.a \
#        $$STATICLIBS_DIR/libjpeg/libs/armeabi-v7a/libjpeg.a \
#        $$STATICLIBS_DIR/libpng/libs/armeabi-v7a/libpng.a \
#        $$STATICLIBS_DIR/libtiff/libs/armeabi-v7a/libtiff.a \
#        $$STATICLIBS_DIR/libwebp/libs/armeabi-v7a/libwebp.a \
#        $$WEBSOCKETS_DIR/libwebsockets.a

LIBS += -Wl,-Bstatic -lcurl -ljpeg -lpng -ltiff -lwebp -lwebsockets -Wl,-Bdynamic -lGLESv2

DESTDIR = $$_PRO_FILE_PWD_/../../bin/android
