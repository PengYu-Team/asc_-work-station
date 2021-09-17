QT += quick
QT += widgets
QT += charts
CONFIG += c++11
QT +=core gui widgets multimedia multimediawidgets
QMAKE_LFLAGS += -no-pie
DEFINES += QT_NO_WARNING_OUTPUT\
                     QT_NO_DEBUG_OUTPUT

LIBS += /home/grandstation/Downloads/opencv-4.5.2/build/lib/libopencv*
LIBS += /usr/lib/x86_64-linux-gnu/libavcodec.so.57
LIBS += /usr/lib/x86_64-linux-gnu/libavformat.so.57
LIBS += /usr/lib/x86_64-linux-gnu/libavutil.so.55
LIBS += /usr/lib/x86_64-linux-gnu/libswscale.so.4

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Thread.cpp \
        UAVPosition.cpp \
        getCommand.cpp \
        main.cpp \
        uav.cpp \
    myDialog.cpp \
    MyMediaPlayer.cpp \
    imageprovider.cpp \
    showimage.cpp \
    ugv.cpp \
    case2msg.cpp \
    case3msg.cpp

RESOURCES += qml.qrc \
    Pic.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    UAVPosition.h \
    Thread.h \
    getCommand.h \
    uav.h \
    myDialog.h \
    MyMediaPlayer.h \
#    opencv.hpp \
    opencv2/core.hpp \
    opencv2/imgproc.hpp \
    opencv2/highgui.hpp \
    opencv2/videoio.hpp \
    imageprovider.h \
    showimage.h \
    ugv.h \
    case2msg.h \
    case3msg.h
