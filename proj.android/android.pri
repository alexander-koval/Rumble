DEFINES += ANDROID
DEFINES += DEBUG
ANDROID_NDK = $$system(printenv ANDROID_NDK)
#QMAKE_LFLAGS += -fuse-ld=bfd -Wl,--fix-cortex-a8

RUMBLE_INCLUDE_PATH += \
    $$ANDROID_NDK/platforms/android-19/arch-arm/usr/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/android \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libcurl/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libjpeg/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libpng/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libtiff/include \
    $$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libwebp/include \
    $$_PRO_FILE_PWD_/../cocos2dx/external/libwebsockets/android/include

LIBS += -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libcurl/libs/armeabi-v7a \
        -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libjpeg/libs/armeabi-v7a \
        -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libpng/libs/armeabi-v7a  \
        -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libtiff/libs/armeabi-v7a \
        -L$$_PRO_FILE_PWD_/../cocos2dx/cocos2dx/platform/third_party/android/prebuilt/libwebp/libs/armeabi-v7a \
        -L$$_PRO_FILE_PWD_/../cocos2dx/external/libwebsockets/android/lib/armeabi-v7a \

LIBS += -L$$ANDROID_NDK/platforms/android-19/arch-arm/lib

LIBS += -L$$OUT_PWD/../cocos2dx/cocos2dx \
        -L$$OUT_PWD/../cocos2dx/CocosDenshion \
        -L$$OUT_PWD/../cocos2dx/extensions \
        -L$$OUT_PWD/../cocos2dx/external/Box2D \
        -L$$OUT_PWD/../cocos2dx/external/chipmunk

LIBS += -lGLESv2

DESTDIR = $$_PRO_FILE_PWD_/../../bin/android
