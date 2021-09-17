#include "getCommand.h"

getCommand::getCommand(QQuickView *parent)
    : QQuickView(parent)
{
    initializeUI();
    auto CommandBtn = this->rootObject()->findChild<QQuickItem*>("btn3");
    if(!CommandBtn){
        qDebug() << Q_FUNC_INFO << QString("Get Item: %1"" faild").arg("btn3");
    }
    else {
        cout << "Have found the item" << endl;
    }
    connect(CommandBtn,SIGNAL(clicked()),this,SLOT( sendMes() ));
    cout << "=====3" << endl;
}

bool getCommand::initializeUI()
{
    cout << "=====0" << endl;
    this->engine()->addImportPath(":/main.qml");
    this->setSource(QUrl("qrc:/main.qml"));
    return !(this->rootObject() == nullptr);
}

QQuickItem * getCommand::getItemByObjectName(const QString &objectName)
{
    auto item = this->rootObject()->findChild<QQuickItem*>(objectName);
    if(!item){
        qDebug() << Q_FUNC_INFO << QString("id,Get Item:%1""faild").arg(objectName);
        return nullptr;
    }
    else{
        cout << "=====1" << endl;
    }
    return item;
}

void getCommand::sendCommand()
{
    cout << "=====2" << endl;
    auto qrBtn1 = this->rootObject()->findChild<QRadioButton*>("triangle");
    auto qrBtn2 = this->rootObject()->findChild<QRadioButton*>("rectangle");
    auto qrBtn3 = this->rootObject()->findChild<QRadioButton*>("circular");

    if(qrBtn1->isChecked()){
        cout << FORMATION_TRIANGLE;
        strcpy(w1.buff, FORMATION_TRIANGLE);
        w1.createWThread();
    }
    else if (qrBtn2->isChecked()){
        cout << FORMATION_RECTANGLE;
        strcpy(w1.buff, FORMATION_RECTANGLE);
        w1.createWThread();
    }
    else if (qrBtn3->isChecked()){
        cout << FORMATION_CIRCULAR;
        strcpy(w1.buff, FORMATION_CIRCULAR);
        w1.createWThread();
    }
    else {cout<<"There is not box had bean choose!"; }
}

void getCommand::sendMes()
{
    cout << "You have clicked the button!" << endl;
}
