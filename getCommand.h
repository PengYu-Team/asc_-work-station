#ifndef GETCOMMAND_H
#define GETCOMMAND_H

#include <QObject>
#include <QQuickView>
#include <QQmlEngine>
#include <QQuickItem>
#include <Thread.h>
#include <QRadioButton>
#include <QPushButton>
#define FORMATION_TRIANGLE "triangle"
#define FORMATION_RECTANGLE "rectangle"
#define FORMATION_CIRCULAR "circular"

class getCommand : public QQuickView
{
    Q_OBJECT
public:
explicit getCommand(QQuickView *parent = nullptr);
    void createThread();

public slots:
void sendCommand();
void sendMes();

private:
    //通过对象名获得控件指针
    QQuickItem *getItemByObjectName(const QString &objectName);
    bool initializeUI();


private:
    WThread w1;

};

#endif // GETCOMMAND_H

//source /home/grandstation/Kongdijiqun/devel/setup.bash
