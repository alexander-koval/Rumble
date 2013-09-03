include(/opt/cocos2d-x/cocos2dx/proj.qt5/common.pri)

TARGET = Rumble

INCLUDEPATH += ..
INCLUDEPATH += ../Classes

SOURCES += main.cpp \
    ../Classes/AppDelegate.cpp \
    ../Classes/GameScreen.cpp

HEADERS += \
    ../Classes/GameScreen.h \
    ../Classes/AppDelegate.h

LIBS += $${LINK_AGAINST_COCOS2DX}
