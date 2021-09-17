#ifndef UAVPOSITION_H
#define UAVPOSITION_H

#include "Thread.h"
#include <QQuickView>
#include <QObject>
#include <QQuickItem>
#include "uav.h"
#include <QQmlContext>
#include <QQmlEngine>
#include <QMetaType>
#include <QRadioButton>
#include <QButtonGroup>
#include "myDialog.h"
#include <iomanip>
#include <QLabel>
#include <QPushButton>
#include "opencv.hpp"
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/videoio.hpp"
#include "opencv2/imgproc/types_c.h"
#include "showimage.h"
#include "ugv.h"

#define FORMATION_TRIANGLE      5// 编队三角  (case1)
#define FORMATION_RECTANGLE     7// 编队矩形
#define FORMATION_CIRCULAR      6// 编队圆形
#define FORMATION_COLUMN        4// 编队一字
#define TAKE_OFF      1          // 起飞
#define LAND          2          // 着陆
#define HOVER         3          // 悬停

#define START         1        // 开始    （case2）
#define RETURN        2        // 返回
#define STOP          3        // 停止
#define GO            4        //小车出发

using namespace cv;
class UAVPosition : public QQuickView
{
    Q_OBJECT
public:
    explicit UAVPosition(QQuickView *parent = nullptr);
    ~UAVPosition();
    bool initializeUI();
    void connectWithThread(RThread *t1);
    void connectSignalAndSlot();
    void createCommandThread();
    void createImageThread();
    void connectWithIThread();
    void connectWebCam();


signals:
//    void setImage();
    void  setIamge(int index);

public slots:
    //更新GUI数据
    void onUpdatePosition(UAV* uav);
    void onUpdatePosition(UGV* ugv);
    void onUpdateImage(QImage image);

    void onSendPosToCar(case2Msg msg);
    void onUpdatePos(case2Msg msg);
    void onUpdateScore(int* scores);

    void AY(); // 确认一字
    void AT(); // 确认矩形
    void AR(); // 确认三角
    void AC(); // 确认圆形
    void sendY();
    void sendT();
    void sendR();
    void sendC();
    void showDialog();

    //发送位置信息
    void sendPosMsg();

    //发送起飞信息 （case 1）
    void sendUp();
    //发送起飞信息 （case 1）
    void sendDown();
    //发送悬停按钮  (case 1)
    void sendHover();
    
    //发送开始信息  （case 3）
    void sendStart();
    //发送返回信息  （case 3）
    void sendReturn();
    //发送停止信息  （case 3）
    void sendStop();

    //发送开始信息  （case 2）
    void sendStart1();
    //发送返回信息  （case 2）
    void sendReturn1();
    //发送停止信息  （case 2）
    void sendStop1();

    //开启图像线程
    void startIThread1();
    //关闭图像线程
    void closeIThread1();
    void startIThread2();
    void closeIThread2();
    void startIThread3();
    void closeIThread3();
    void startIThread4();
    void closeIThread4();
    void startIThread5();
    void closeIThread5();
    void startIThread6();
    void closeIThread6();
    void startIThread7();
    void closeIThread7();
    void startIThread8();
    void closeIThread8();
    void startIThread9();
    void closeIThread9();
    void startIThread10();
    void closeIThread10();

    //连接对应无人机摄像头
    void connectCam(int index);
    void closeCam(int index);

    
private:
    //通过对象名获得控件指针
    QQuickItem *getItemByObjectName(const QString &objectName);

    int encodeMes101(char* buff, int8_t index,  float* pos);
    int encodeMes102(char* buff, int8_t index, int8_t command);
    int encodeMes103(char* buff, int8_t index, int8_t command, float* pos);
    int encodeMes104(char* buff, int8_t index, int8_t command);

    void passTheUAVStateToQml(int index, UAV* uav);  //将UAV State 传递到qml
    void passTheQImageToQML(QImage image);
    void passTheUGVStateToQml(int index, UGV* ugv);  //将UGV State 传递到qml

    void passThePosToCar(case2Msg msg);
    void passTheScoreToQml(int* score);
    void passThePosToQML(case2Msg msg);

    void sendMes101(int8_t index, float* pos);
    void sendMes102(int8_t);
    void sendMes103(int8_t index, int8_t command, float* pos);
    void sendMes104(int8_t);

private:
    myDialog d1;
    VideoCapture capture;

    int8_t score = 0;
    int scoreRed = 0, scoreBlue = 0;

    float case2Pos[3] = {0.0 ,0.0 ,0.0};
    vector<char*> IPs;
    vector<char*> RtmpUrls;

    vector<WThread*> WThreads;
    vector<IThread*> IThreads;
    vector<ShowImage*> ShowImages;

//    WThread* t1 ;
//    WThread* t2 ;
//    WThread* t3 ;
//    WThread* t4 ;
//    WThread* t5 ;
//    WThread* t6 ;
//    WThread* t7 ;
//    WThread* t8 ;
//    WThread* t9 ;
//    WThread* t10 ;


};

#endif // UAVPOSITION_H
