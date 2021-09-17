#ifndef MYDIALOG_H
#define MYDIALOG_H

#include <QWidget>
#include <QDialog>
#include <QQuickItem>
#include <QPushButton>
#include <QLineEdit>
#include <iostream>
#include "Thread.h"
#include <QIntValidator>

class myDialog : public QDialog
{
    Q_OBJECT
public:
    explicit myDialog(QWidget *parent = nullptr);

signals:

public slots:
    void sendMes();
private:
    QLineEdit* Editid;
    QLineEdit* Editx;
    QLineEdit* Edity;
    QLineEdit* Editz;

public:
    int FloatCheck(QString float_str);

    QPushButton* Btn;
    WThread* thread;
    QString Eid = "No Set!" ;
    QString Ex = "No Set!" ;
    QString Ey = "No Set!" ;
    QString Ez = "No Set!" ;

    bool input = false;
    int8_t index;
    float pos[3];

};

#endif // MYDIALOG_H
