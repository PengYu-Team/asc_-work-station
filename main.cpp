#include "Thread.h"
#include "UAVPosition.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWidgets/QApplication>
#include <QQmlContext>
#include <QMetaType>
#include "getCommand.h"
//#include "MyMediaPlayer.h"

int main(int argc, char *argv[])
{
    //read the message
    RThread* Thread1 = new RThread();
    Thread1->start();

    QApplication app(argc, argv);

    UAVPosition U;
    U.connectWithThread(Thread1);
    U.show();
//    U.connectWebCam();

//    U.createImageThread();
//    if(U.ithreadConnect == true) U.connectWithIThread();

    return app.exec();
}

