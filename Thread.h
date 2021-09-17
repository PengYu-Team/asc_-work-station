#ifndef THREAD_H
#define THREAD_H

#include <QObject>
#include <QThread>
#include <QTimer>
#include <QObject>
#include<iostream>

#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <string>
#include <cstring>
#include <string.h>
#include "uav.h"
#include <sstream>
#include <map>
#include <QString>
#include <QMetaType>
#include <QQuickView>
#include <QQuickItem>
#include <fcntl.h>

#include "opencv.hpp"
#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/videoio.hpp"
#include "opencv2/imgproc/types_c.h"
#include "ugv.h"

#include "case2msg.h"
#include "case3msg.h"
//读取照片头文件
extern "C"
{
#include <libswscale/swscale.h>
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
}
#pragma comment(lib, "swscale.lib")
#pragma comment(lib, "avcodec.lib")
#pragma comment(lib, "avutil.lib")
#pragma comment(lib, "avformat.lib")
#pragma comment(lib,"ws2_32.lib")

#define Random(x) (rand()%x)

#define MAXLINE  100
#define GENERATEDATA_TIMER (100)

using namespace std;
using namespace cv;


/*================================================*
 *          1.接收状态数据并进行解码Thread            *
 *                  与UI交互                       *
 *================================================*/
class RThread : public QObject
{
    Q_OBJECT

public:
    explicit RThread(QObject *parent = nullptr);
    ~RThread();
public:
    void start();
    void stop();

signals:
    void continueTimer();
    void stopTimer();
//    void sendValue(int val);
//    void PositionxChanged();

void signalUAV(UAV* a);
void signalUGV(UGV* g);
void signalMsg1(case2Msg msg1);
void signalScores(int* scores);

private:
    void createRThread();
    void createTimer();
    void generateData();
    void decodeMsg1(char*);   //解码UAV状态数据
    void decodeMsg2(char*);   //解码UGV状态数据
    void decodeMsg3(char*);   //
    void decodeMsg4(char*);

private slots:
    void onGenerateTimeout();
    void onStartTimer();
    void onStopTimer();
private:
    QTimer *read_timer;
    QThread *read_thread;
    bool reading_status = 0;

    // UDP_Socket
    int rece_sock;
    struct sockaddr_in  servaddr;

    char buff[MAXLINE];
    int n, index = 0;
    UAV a[9];
    UGV g[3];

    case2Msg msg1;

    int scoresRed[5] = {0, 0, 0, 0, 0};
    int scoresBlue[5]= {0, 0, 0, 0, 0};
    int scores[2] = {0, 0};

    int debug = 0;
};


/*================================================
 *            2.发送命令线程
 *               与UI交互
 =================================================*/
class WThread : public QObject
{
    Q_OBJECT
public:
    explicit WThread(QObject *parent = nullptr , char* url = "127.0.0.1");
    ~WThread();
public slots:
    void command(int len);
    void sendMsg(int len);
    void createWThread();

public: signals:
    void send(int len);

public:
    QThread *write_thread;
    int socketfd;
    struct sockaddr_in sockaddr;//
    char buff[MAXLINE];
    int n, index;
    char *servInetAddr ;
    bool isConnect = true;
};


/*================================================
 *          3.接受图像数据
 *               与UI交互
 =================================================*/
static int callback_flag = 0;
class IThread : public QObject
{
    Q_OBJECT

public:
    explicit IThread(QObject *parent = nullptr);
    ~IThread();

    void start();
    void stop();
    int isConnect = 0;
    void connectNGINX(char* url = "rtmp:://127.0.0.1/live");

signals:
    void continueTimer();
    void stopTimer();
    void sendValue(int val);
    void PositionxChanged();
    void signalQImage(QImage);

private:
    void createIThread();
    void createTimer();
    void generateData();
    cv::Mat QImage2cvMat(QImage image);

private slots:
    void onGenerateTimeout();
    void onStartTimer();
    void onStopTimer();
private:
    QTimer *read_timer;
    QThread *read_thread;
    bool reading_status = 0;
    QImage Ithread_img;

    AVFormatContext *pFormatCtx ;
    AVCodecContext *pCodecCtx ;
    AVCodec *pCodec ;
    AVFrame *pFrame , *pFrameRGB ;
    AVPacket *packet ;
    uint8_t *out_buffer ;

    struct SwsContext *img_convert_ctx;

    int videoStream, i, numBytes;
    int ret, got_picture;

    typedef struct {
        time_t lasttime;
    } Runner;

    // 超时回调函数
    static int interrupt_callback(void *p) {
        if(callback_flag == 0){
            Runner *r = (Runner *)p;
            if (r->lasttime > 0) {
                if (time(NULL) - r->lasttime > 8) {
                    // 等待超过8s则中断
                    cout << "over time" <<endl;
                    return 1;
                }
            }
        }
        else{
            return 0;
        }
    }

};
#endif // THREAD_H
