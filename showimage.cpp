#include "showimage.h"

QImage ShowImage::MattoQImage(Mat cvImg)
{
    QImage qImg;
    if(cvImg.channels()==3)
    {
      cvtColor(cvImg,cvImg,CV_BGR2RGB);
        qImg =QImage((const unsigned char*)(cvImg.data),
                    cvImg.cols, cvImg.rows,
                    cvImg.cols*cvImg.channels(),
                    QImage::Format_RGB888);
    }
    else if(cvImg.channels()==1) {
         qImg =QImage((const unsigned char*)(cvImg.data),
                    cvImg.cols,cvImg.rows,
                    cvImg.cols*cvImg.channels(),
                    QImage::Format_Indexed8);

    }
    else
    {
        qImg =QImage((const unsigned char*)(cvImg.data),

                    cvImg.cols,cvImg.rows,
                    cvImg.cols*cvImg.channels(),
                    QImage::Format_RGB888);
    }
    return qImg;
}

ShowImage::ShowImage(QObject *parent) :
    QObject(parent)
{
    m_pImgProvider = new ImageProvider();
}


void ShowImage::setImage(QImage Image1)
{
    m_pImgProvider->img = Image1.copy();
    emit callQmlRefeshImg();
}


void ShowImage::connectWithThread(IThread* t)
{
    connect(t, SIGNAL(signalQImage(QImage)),this,SLOT(setImage(QImage)));
}

void ShowImage::closewithThread(IThread* t){
    disconnect(t, SIGNAL(signalQImage(QImage)),this,SLOT(setImage(QImage)));
}


