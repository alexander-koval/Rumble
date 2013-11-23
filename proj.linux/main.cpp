#include "../Classes/AppDelegate.h"
#include "cocos2d.h"
#include "CCEGLView.h"

USING_NS_CC;

int main(int argc, char **argv)
{
    // create the application instance
    AppDelegate app;
    CCEGLView* eglView = CCEGLView::sharedOpenGLView();
    eglView->setFrameSize(1024, 768);

    return CCApplication::sharedApplication()->run();
}
