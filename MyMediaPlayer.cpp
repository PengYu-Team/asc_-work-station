#include "MyMediaPlayer.h"

void MyMediaPlayer::play()
{
    qDebug()<<"play...";
    QMediaPlayer::setMedia(QUrl::fromLocalFile("/home/grandstation/Documents/sjl/Player_Test/Test2.mp4"));
    QMediaPlayer::play();
//    QString strTitle = QMediaPlayer::metaData("Title").toString();
//    QString strSize= QMediaPlayer::metaData("Size").toString();
//    qDebug()<<"title: " + strTitle + "size: "+ strSize;
}
MyMediaPlayer::MyMediaPlayer(QObject* parent, Flags flags): QMediaPlayer(parent, flags)
{
//    qDebug() << "Have create the Media!" ;
}


void MyMediaPlayer::setVideoSurface(QAbstractVideoSurface* surface)
{
    qDebug() << "Changing surface";
    m_surface = surface;
    setVideoOutput(m_surface);
}

QAbstractVideoSurface* MyMediaPlayer::getVideoSurface()
{
    return m_surface;
}


