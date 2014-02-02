EXECUTABLE = Rumble

DEBUG=1
LINUX=1

SOURCES = main.cpp \
        ../Classes/AppDelegate.cpp \
        ../Classes/GameScreen.cpp \
	../Classes/utils/FromTiledMap.cpp \

#COCOS_ROOT = $(shell echo $(COCOS2D_ROOT))
LIB_DIR = $(COCOS_ROOT)/lib/linux/debug
COCOS_LIBS = $(LIB_DIR)/libcocos2d.so $(LIB_DIR)/libcocosdenshion.so
include $(COCOS_ROOT)/cocos2dx/proj.linux/cocos2dx.mk

CC = clang
CXX = clang++

CXXFLAGS = -std=c++11 -g -Werror -fPIC -MMD

INCLUDES += \
	-I../ \
	-I../Classes \
	-I../Classes/utils \
	-I$(COCOS_ROOT)/cocos2dx/base_nodes \
	-I$(COCOS_ROOT)/CocosDenshion/include \
	-I$(COCOS_ROOT)/extensions/ \
	-I$(COCOS_ROOT)/external/ \
	-I$(COCOS_ROOT)/external/Box2D \
	-I$(COCOS_ROOT)/external/Box2D/Dynamics \
	-I$(COCOS_ROOT)/external/chipmunk/include/chipmunk

#SHAREDLIBS = -lcocos2d -lcocosdenshion -lcurl
SHAREDLIBS += -lcurl
SHAREDLIBS += -L$(COCOS_ROOT)/cocos2dx/lib/linux/debug -lcocos2d -lcocosdenshion
STATICLIBS += \
	$(STATICLIBS_DIR)/libcurl.a \
	$(LIB_DIR)/libextension.a \
	$(LIB_DIR)/libbox2d.a \
	$(LIB_DIR)/libchipmunk.a

$(TARGET): $(OBJECTS) $(STATICLIBS) $(COCOS_LIBS) $(CORE_MAKEFILE_LIST)
	@mkdir -p $(@D)
	$(LOG_LINK)$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@ $(SHAREDLIBS) $(STATICLIBS)

$(OBJ_DIR)/%.o: %.cpp $(CORE_MAKEFILE_LIST)
	@mkdir -p $(@D)
	$(LOG_CXX)$(CXX) $(CXXFLAGS) $(INCLUDES) $(DEFINES) $(VISIBILITY) -c $< -o $@

$(OBJ_DIR)/%.o: ../%.cpp $(CORE_MAKEFILE_LIST)
	@mkdir -p $(@D)
	$(LOG_CXX)$(CXX) $(CXXFLAGS) $(INCLUDES) $(DEFINES) $(VISIBILITY) -c $< -o $@
