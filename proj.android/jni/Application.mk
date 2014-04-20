APP_PLATFORM	:= android-14
APP_ABI			:=	armeabi-v7a
#APP_ABI			:= x86
APP_STL 		:= gnustl_static
APP_CFLAGS		:= -g -ggdb -O0
APP_CPPFLAGS 	:= -frtti -DCC_ENABLE_BOX2D_INTEGRATION=1 -DCOCOS2D_DEBUG=1 -std=c++11
APP_OPTIM		:= debug

