#ifndef SHOWIMAGE_H
#define SHOWIMAGE_H
#include<imageprovider.h>
#include <opencv.hpp>
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/videoio.hpp"
#include "opencv2/imgproc/types_c.h"
#include "Thread.h"
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

using namespace cv;
using namespace std;
class ShowImage : public QObject
{
    Q_OBJECT
public:
    explicit ShowImage(QObject *parent = 0);
    ImageProvider *m_pImgProvider;
    QImage  MattoQImage(Mat cvImg);
    Mat QImage2cvMat(QImage image);
    void connectWithThread(IThread* t);
    void closewithThread(IThread* t);

public slots:
    void setImage(QImage Image1);

signals:
    void callQmlRefeshImg();
private:


};
#endif // IMAGESHOW_H
