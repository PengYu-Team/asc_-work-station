
#include "UAVPosition.h"

UAVPosition::UAVPosition(QQuickView *parent)
    : QQuickView(parent)
{   qRegisterMetaType<UAV>("UAV");
    qRegisterMetaType<UGV>("UGV");
    qRegisterMetaType<case2Msg>("case2Msg");
    qRegisterMetaType<case3Msg>("case3Msg");
    createImageThread();
    initializeUI();
    connectSignalAndSlot();
    createCommandThread();
    connectWebCam();
}

UAVPosition::~UAVPosition(){
}

void UAVPosition::connectSignalAndSlot(){
    //连接三个复选框及对应的信息发送事件
    auto qrBtn1 = this->rootObject()->findChild<QQuickItem*>("triangle");
    auto qrBtn2 = this->rootObject()->findChild<QQuickItem*>("rectangle");
    auto qrBtn3 = this->rootObject()->findChild<QQuickItem*>("circular");
    auto qrBtn4 = this->rootObject()->findChild<QQuickItem*>("column");
    connect(qrBtn1,SIGNAL(clicked()),this,SLOT(AT()));
    connect(qrBtn2,SIGNAL(clicked()),this,SLOT(AR()));
    connect(qrBtn3,SIGNAL(clicked()),this,SLOT(AC()));
    connect(qrBtn4,SIGNAL(clicked()),this,SLOT(AY()));
    connect(d1.Btn, SIGNAL(clicked()),this,SLOT(sendPosMsg()));

    //连接按钮和起飞信息
    auto UpBtn = this->rootObject()->findChild<QQuickItem*>("UpBtn");
    connect(UpBtn,SIGNAL(clicked()),this,SLOT(sendUp()));
    //连接按钮和降落信息
    auto LandBtn = this->rootObject()->findChild<QQuickItem*>("DownBtn");
    connect(LandBtn,SIGNAL(clicked()),this,SLOT(sendDown()));
    //连接按钮和降落信息
    auto HoverBtn = this->rootObject()->findChild<QQuickItem*>("HoverBtn");
    connect(HoverBtn,SIGNAL(clicked()),this,SLOT(sendHover()));

    //连接按钮及窗口弹出事件
    auto Btn4 = this->rootObject()->findChild<QQuickItem*>("BtnS");
    connect(Btn4,SIGNAL(clicked()),this,SLOT(showDialog()));

    //连接按钮和开始信息(case3)
    auto startBtn = this->rootObject()->findChild<QQuickItem*>("startBtn");
    connect(startBtn,SIGNAL(clicked()),this,SLOT(sendStart()));
    //连接按钮和返回信息(case3)
    auto returnBtn = this->rootObject()->findChild<QQuickItem*>("returnBtn");
    connect(returnBtn,SIGNAL(clicked()),this,SLOT(sendReturn()));
    //连接按钮和停止信息(case3)
    auto stopBtn = this->rootObject()->findChild<QQuickItem*>("stopBtn");
    connect(stopBtn,SIGNAL(clicked()),this,SLOT(sendStop()));

    //连接按钮和开始信息(case2)
    auto startBtn1 = this->rootObject()->findChild<QQuickItem*>("startBtn1");
    connect(startBtn1,SIGNAL(clicked()),this,SLOT(sendStart1()));
    //连接按钮和返回信息(case2)
    auto returnBtn1 = this->rootObject()->findChild<QQuickItem*>("returnBtn1");
    connect(returnBtn1,SIGNAL(clicked()),this,SLOT(sendReturn1()));
    //连接按钮和停止信息(case2)
    auto stopBtn1 = this->rootObject()->findChild<QQuickItem*>("stopBtn1");
    connect(stopBtn1,SIGNAL(clicked()),this,SLOT(sendStop1()));

    //连接ON  OFF按钮
    auto openBtn1 = this->rootObject()->findChild<QQuickItem*>("openBtn1");
    connect(openBtn1, SIGNAL(clicked()),this,SLOT(startIThread1()));
    auto closeBtn1 = this->rootObject()->findChild<QQuickItem*>("closeBtn1");
    connect(closeBtn1, SIGNAL(clicked()),this,SLOT(closeIThread1()));

    auto openBtn2 = this->rootObject()->findChild<QQuickItem*>("openBtn2");
    connect(openBtn2, SIGNAL(clicked()),this,SLOT(startIThread2()));
    auto closeBtn2 = this->rootObject()->findChild<QQuickItem*>("closeBtn2");
    connect(closeBtn2, SIGNAL(clicked()),this,SLOT(closeIThread2()));

    auto openBtn3 = this->rootObject()->findChild<QQuickItem*>("openBtn3");
    connect(openBtn3, SIGNAL(clicked()),this,SLOT(startIThread3()));
    auto closeBtn3 = this->rootObject()->findChild<QQuickItem*>("closeBtn3");
    connect(closeBtn3, SIGNAL(clicked()),this,SLOT(closeIThread3()));

    auto openBtn4 = this->rootObject()->findChild<QQuickItem*>("openBtn4");
    connect(openBtn4, SIGNAL(clicked()),this,SLOT(startIThread4()));
    auto closeBtn4 = this->rootObject()->findChild<QQuickItem*>("closeBtn4");
    connect(closeBtn4, SIGNAL(clicked()),this,SLOT(closeIThread4()));

    auto openBtn5 = this->rootObject()->findChild<QQuickItem*>("openBtn5");
    connect(openBtn5, SIGNAL(clicked()),this,SLOT(startIThread5()));
    auto closeBtn5 = this->rootObject()->findChild<QQuickItem*>("closeBtn5");
    connect(closeBtn5, SIGNAL(clicked()),this,SLOT(closeIThread5()));

    auto openBtn6 = this->rootObject()->findChild<QQuickItem*>("openBtn6");
    connect(openBtn6, SIGNAL(clicked()),this,SLOT(startIThread6()));
    auto closeBtn6 = this->rootObject()->findChild<QQuickItem*>("closeBtn6");
    connect(closeBtn6, SIGNAL(clicked()),this,SLOT(closeIThread6()));

    auto openBtn7 = this->rootObject()->findChild<QQuickItem*>("openBtn7");
    connect(openBtn7, SIGNAL(clicked()),this,SLOT(startIThread7()));
    auto closeBtn7 = this->rootObject()->findChild<QQuickItem*>("closeBtn7");
    connect(closeBtn7, SIGNAL(clicked()),this,SLOT(closeIThread7()));

    auto openBtn8 = this->rootObject()->findChild<QQuickItem*>("openBtn8");
    connect(openBtn8, SIGNAL(clicked()),this,SLOT(startIThread8()));
    auto closeBtn8 = this->rootObject()->findChild<QQuickItem*>("closeBtn8");
    connect(closeBtn8, SIGNAL(clicked()),this,SLOT(closeIThread8()));

    auto openBtn9 = this->rootObject()->findChild<QQuickItem*>("openBtn9");
    connect(openBtn9, SIGNAL(clicked()),this,SLOT(startIThread9()));
    auto closeBtn9 = this->rootObject()->findChild<QQuickItem*>("closeBtn9");
    connect(closeBtn9, SIGNAL(clicked()),this,SLOT(closeIThread9()));

    auto openBtn10 = this->rootObject()->findChild<QQuickItem*>("openBtn10");
    connect(openBtn10, SIGNAL(clicked()),this,SLOT(startIThread10()));
    auto closeBtn10 = this->rootObject()->findChild<QQuickItem*>("closeBtn10");
    connect(closeBtn10, SIGNAL(clicked()),this,SLOT(closeIThread10()));
}

void UAVPosition::createCommandThread(){
    WThread* t1 = new WThread(nullptr, "192.168.1.11");
    if(t1->isConnect == true) cout << "UAV1 connect !" << endl;
    t1->createWThread();
    WThread* t2 = new WThread(nullptr, "192.168.1.12");
    if(t2->isConnect == true) cout << "UAV2 connect !" << endl;
    t2->createWThread();
    WThread* t3 = new WThread(nullptr, "192.168.1.13");
    if(t3->isConnect == true) cout << "UAV3 connect !" << endl;
    t3->createWThread();
    WThread* t4 = new WThread(nullptr, "192.168.1.14");
    if(t4->isConnect == true) cout << "UAV4 connect !" << endl;
    t4->createWThread();
    WThread* t5 = new WThread(nullptr, "192.168.1.15");
    if(t5->isConnect == true) cout << "UAV5 connect !" << endl;
    t5->createWThread();
    WThread* t6 = new WThread(nullptr, "192.168.1.16");
    if(t6->isConnect == true) cout << "UAV6 connect !" << endl;
    t6->createWThread();
    WThread* t7 = new WThread(nullptr, "192.168.1.17");
    if(t7->isConnect == true) cout << "UAV7 connect !" << endl;
    t7->createWThread();
    WThread* t8 = new WThread(nullptr, "192.168.1.18");
    if(t8->isConnect == true) cout << "UAV8 connect !" << endl;
    t8->createWThread();
    WThread* t9 = new WThread(nullptr, "192.168.1.21");
    if(t9->isConnect == true) cout << "UAV9 connect !" << endl;
    t9->createWThread();
    WThread* t10 = new WThread(nullptr,"192.168.1.22");
    if(t10->isConnect == true) cout << "UAV10 connect !" << endl;
    t10->createWThread();

    WThreads.push_back(t1);
    WThreads.push_back(t2);
    WThreads.push_back(t3);
    WThreads.push_back(t4);
    WThreads.push_back(t5);
    WThreads.push_back(t6);
    WThreads.push_back(t7);
    WThreads.push_back(t8);
    WThreads.push_back(t9);
    WThreads.push_back(t10);
}

void UAVPosition::createImageThread(){

    QQmlEngine *engine = this->engine();

    IThread* it1 = new IThread(nullptr);
    ShowImage *CodeImage1 = new ShowImage();
    CodeImage1->connectWithThread(it1);
    this->rootContext()->setContextProperty("CodeImage1",CodeImage1);
    engine->addImageProvider(QLatin1String("CodeImg1"), CodeImage1->m_pImgProvider);
    IThreads.push_back(it1);

    IThread* it2 = new IThread(nullptr);
    ShowImage *CodeImage2 = new ShowImage();
    CodeImage2->connectWithThread(it2);
    this->rootContext()->setContextProperty("CodeImage2",CodeImage2);
    engine->addImageProvider(QLatin1String("CodeImg2"), CodeImage2->m_pImgProvider);
    IThreads.push_back(it2);

    IThread* it3 = new IThread(nullptr);
    ShowImage *CodeImage3 = new ShowImage();
    CodeImage3->connectWithThread(it3);
    this->rootContext()->setContextProperty("CodeImage3",CodeImage3);
    engine->addImageProvider(QLatin1String("CodeImg3"), CodeImage3->m_pImgProvider);
    IThreads.push_back(it3);

    IThread* it4 = new IThread(nullptr);
    ShowImage *CodeImage4 = new ShowImage();
    CodeImage4->connectWithThread(it4);
    this->rootContext()->setContextProperty("CodeImage4",CodeImage4);
    engine->addImageProvider(QLatin1String("CodeImg4"), CodeImage4->m_pImgProvider);
    IThreads.push_back(it4);

    IThread* it5 = new IThread(nullptr);
    ShowImage *CodeImage5 = new ShowImage();
    CodeImage5->connectWithThread(it5);
    this->rootContext()->setContextProperty("CodeImage5",CodeImage5);
    engine->addImageProvider(QLatin1String("CodeImg5"), CodeImage5->m_pImgProvider);
    IThreads.push_back(it5);

    IThread* it6 = new IThread(nullptr);
    ShowImage *CodeImage6 = new ShowImage();
    CodeImage6->connectWithThread(it6);
    this->rootContext()->setContextProperty("CodeImage6",CodeImage6);
    engine->addImageProvider(QLatin1String("CodeImg6"), CodeImage6->m_pImgProvider);
    IThreads.push_back(it6);

    IThread* it7 = new IThread(nullptr);
    ShowImage *CodeImage7 = new ShowImage();
    CodeImage7->connectWithThread(it7);
    this->rootContext()->setContextProperty("CodeImage7",CodeImage7);
    engine->addImageProvider(QLatin1String("CodeImg7"), CodeImage7->m_pImgProvider);
    IThreads.push_back(it7);

    IThread* it8 = new IThread(nullptr);
    ShowImage *CodeImage8 = new ShowImage();
    CodeImage8->connectWithThread(it8);
    this->rootContext()->setContextProperty("CodeImage8",CodeImage8);
    engine->addImageProvider(QLatin1String("CodeImg8"), CodeImage8->m_pImgProvider);
    IThreads.push_back(it8);

    IThread* it9 = new IThread(nullptr);
    ShowImage *CodeImage9 = new ShowImage();
    CodeImage9->connectWithThread(it9);
    this->rootContext()->setContextProperty("CodeImage9",CodeImage9);
    engine->addImageProvider(QLatin1String("CodeImg9"), CodeImage9->m_pImgProvider);
    IThreads.push_back(it9);

    IThread* it10 = new IThread(nullptr);
    ShowImage *CodeImage10 = new ShowImage();
    CodeImage10->connectWithThread(it10);
    this->rootContext()->setContextProperty("CodeImage10",CodeImage10);
    engine->addImageProvider(QLatin1String("CodeImg10"), CodeImage10->m_pImgProvider);
    IThreads.push_back(it10);

}

void UAVPosition::connectWithThread(RThread* t1)
{
    connect(t1, SIGNAL(signalUAV(UAV*)),this,SLOT(onUpdatePosition(UAV*)));
    connect(t1, SIGNAL(signalUGV(UGV*)),this,SLOT(onUpdatePosition(UGV*)));
    connect(t1, SIGNAL(signalMsg1(case2Msg)),this,SLOT(onSendPosToCar(case2Msg)));
    connect(t1, SIGNAL(signalMsg1(case2Msg)),this,SLOT(onUpdatePos(case2Msg)));
    connect(t1, SIGNAL(signalScores(int*)),this,SLOT(onUpdateScore(int*)));
}

void UAVPosition::connectWithIThread(){
    for(int i = 0 ; i < IThreads.size(); ++i){
        ShowImages[i]->connectWithThread(IThreads[i]);
    }
}

QQuickItem* UAVPosition::getItemByObjectName(const QString &objectName)
{
    auto item = this->rootObject()->findChild<QQuickItem *>(objectName);
    return item;
}

void UAVPosition::onUpdateImage(QImage image){
}
void UAVPosition::onUpdatePosition(UAV* uav)
{
    for(int index =1; index <= 8; index++){
        passTheUAVStateToQml(index,uav);
    }
}
void UAVPosition::onUpdatePosition(UGV* ugv)
{
    for(int index =1; index <= 2; index++){
        passTheUGVStateToQml(index, ugv);
    }
}
void UAVPosition::onSendPosToCar(case2Msg msg){
    passThePosToCar(msg);
}
void UAVPosition::onUpdatePos(case2Msg msg){
    passThePosToQML(msg);
}
void UAVPosition::sendPosMsg(){
    if(d1.input == false){
        cout << "Input error" << endl;
        return;
    }
    sendMes101(d1.index, d1.pos);
}
void UAVPosition::onUpdateScore(int* scores){
    passTheScoreToQml(scores);
}
bool UAVPosition::initializeUI()
{
    this->setTitle("无人机地面站");
    this->engine()->addImportPath(":/main.qml");
    this->setSource(QUrl("qrc:/main.qml"));
    return !(this->rootObject() == nullptr);

}

void UAVPosition::connectWebCam(){
//    IThreads[0]->connectNGINX("rtmp://localhost:1935/live/live1");
//    IThreads[1]->connectNGINX("rtmp://localhost:1935/live/live2");
//    IThreads[2]->connectNGINX("rtmp://localhost:1935/live/live3");
//    IThreads[3]->connectNGINX("rtmp://localhost:1935/live/live4");
//    IThreads[4]->connectNGINX("rtmp://localhost:1935/live/live5");
//    IThreads[5]->connectNGINX("rtmp://localhost:1935/live/live6");
//    IThreads[6]->connectNGINX("rtmp://localhost:1935/live/live7");
//    IThreads[7]->connectNGINX("rtmp://localhost:1935/live/live8");
//    IThreads[8]->connectNGINX("rtmp://localhost:1935/live/live9");
//    IThreads[9]->connectNGINX("rtmp://localhost:1935/live/live10");
}

void UAVPosition::passTheUAVStateToQml(int index, UAV* uav)
{
    QString s1 = "uav" ;
    QString t1 = QString::number(index,9);
    s1 += t1;

    string  t2 = "setPosition" ;
    t2 += to_string(index);
    char s2[13] ;
    strcpy(s2,t2.c_str());

    string t3 = "setState";
    t3 += to_string(index);
    char s3[10];
    strcpy(s3,t3.c_str());

    QQuickItem* UAVItem = getItemByObjectName(s1);
    if(UAVItem){
        QMetaObject::invokeMethod(UAVItem, s2 //九个参数 x, y, z, Vx, Vy, Vz, roll,yaw.pitch
                                  , Q_ARG(QVariant, uav[index].position[0])
                                  , Q_ARG(QVariant, uav[index].position[1])
                                  , Q_ARG(QVariant, uav[index].position[2])
                                , Q_ARG(QVariant, uav[index].position[3])
                                , Q_ARG(QVariant, uav[index].position[4])
                                , Q_ARG(QVariant, uav[index].position[5])
                            , Q_ARG(QVariant, uav[index].position[6])
                            , Q_ARG(QVariant, uav[index].position[7])
                            , Q_ARG(QVariant, uav[index].position[8]));

        QMetaObject::invokeMethod(UAVItem, s3 //四个参数 connected armed mode battery_state
                , Q_ARG(QVariant, uav[index].state[0])
                , Q_ARG(QVariant, uav[index].state[1])
                , Q_ARG(QVariant, uav[index].state[2])
                , Q_ARG(QVariant, uav[index].position[9]));
    }
    //    更改ChartView 坐标
     QQuickItem* ChartView = getItemByObjectName("chartView");
     if(ChartView){
         QMetaObject::invokeMethod(ChartView, "setPositionC1"
                                   , Q_ARG(QVariant, uav[1].position[0])
                                   , Q_ARG(QVariant, uav[1].position[1])
                                   , Q_ARG(QVariant,uav[2].position[0])
                                   , Q_ARG(QVariant,uav[2].position[1])
                                   , Q_ARG(QVariant, uav[3].position[0])
                                   , Q_ARG(QVariant, uav[3].position[1])
                                   , Q_ARG(QVariant,uav[4].position[0])
                                   , Q_ARG(QVariant,uav[4].position[1]));
         QMetaObject::invokeMethod(ChartView, "setPositionC2"
                                   , Q_ARG(QVariant, uav[5].position[0])
                                   , Q_ARG(QVariant, uav[5].position[1])
                                   , Q_ARG(QVariant,uav[6].position[0])
                                   , Q_ARG(QVariant,uav[6].position[1])
                                   , Q_ARG(QVariant, uav[7].position[0])
                                   , Q_ARG(QVariant, uav[7].position[1])
                                   , Q_ARG(QVariant,uav[8].position[0])
                                   , Q_ARG(QVariant,uav[8].position[1]));
     }
}
void UAVPosition::passTheUGVStateToQml(int index, UGV* ugv)
{
    QString s1 = "ugv" ;
    QString t1 = QString::number(index,3);
    s1 += t1;

    string  t2 = "setPosition" ;
    t2 += to_string(index);
    char s2[13] ;
    strcpy(s2,t2.c_str());

    string t3 = "setState";
    t3 += to_string(index);
    char s3[10];
    strcpy(s3,t3.c_str());

    QQuickItem* UGVItem = getItemByObjectName(s1);
    if(UGVItem){
        QMetaObject::invokeMethod(UGVItem, s2 //九个参数 x, y, z, Vx, Vy, Vz, Ax, Ay, Az
                                  , Q_ARG(QVariant, ugv[index].position[0])
                                  , Q_ARG(QVariant, ugv[index].position[1])
                                  , Q_ARG(QVariant, ugv[index].position[2])
                        , Q_ARG(QVariant, ugv[index].position[3])
                        , Q_ARG(QVariant, ugv[index].position[4])
                        , Q_ARG(QVariant, ugv[index].position[5])
                    , Q_ARG(QVariant, ugv[index].position[6])
                    , Q_ARG(QVariant, ugv[index].position[7])
                    , Q_ARG(QVariant, ugv[index].position[8]));

        QMetaObject::invokeMethod(UGVItem, s3 //两个参数 connected， battery_state
                , Q_ARG(QVariant, ugv[index].state)
                , Q_ARG(QVariant, ugv[index].position[9]));
    }
    QQuickItem* ChartView = getItemByObjectName("chartView");
    if(ChartView){
        QMetaObject::invokeMethod(ChartView, "setPositionC3"
                                  , Q_ARG(QVariant, ugv[1].position[0])
                                  , Q_ARG(QVariant, ugv[1].position[1])
                                  , Q_ARG(QVariant,ugv[2].position[0])
                                  , Q_ARG(QVariant,ugv[2].position[1]));
    }
}

void UAVPosition::passThePosToCar(case2Msg msg){
    if(msg.index!=9 && msg.index!=10)  sendMes103(msg.index, GO, msg.pos);
}

void UAVPosition::passThePosToQML(case2Msg msg){
    if(  ((msg.index-1)/4 == 0) ){
        QQuickItem* ChartView = getItemByObjectName("target1");
        QMetaObject::invokeMethod(ChartView, "setDetection1"
                                  , Q_ARG(QVariant, msg.index)
                                  , Q_ARG(QVariant, msg.objectName)
                                  , Q_ARG(QVariant, msg.pos[0])
                                  , Q_ARG(QVariant, msg.pos[1])
                                  , Q_ARG(QVariant, msg.pos[2]));
    }
    else if((msg.index-1)/4 == 1) {
        QQuickItem* ChartView = getItemByObjectName("target2");
        QMetaObject::invokeMethod(ChartView, "setDetection2"
                                  , Q_ARG(QVariant, msg.index)
                                  , Q_ARG(QVariant, msg.objectName)
                                  , Q_ARG(QVariant, msg.pos[0])
                                  , Q_ARG(QVariant, msg.pos[1])
                                  , Q_ARG(QVariant, msg.pos[2]));
    }
    else if(msg.index == 9){
        QQuickItem* ChartView = getItemByObjectName("target1");
        QMetaObject::invokeMethod(ChartView, "setDetectionUGV1"
                                  , Q_ARG(QVariant, msg.index)
                                  , Q_ARG(QVariant, msg.objectName)
                                  , Q_ARG(QVariant, msg.pos[0])
                                  , Q_ARG(QVariant, msg.pos[1])
                                  , Q_ARG(QVariant, msg.pos[2]));
    }
    else if(msg.index == 10){
        QQuickItem* ChartView = getItemByObjectName("target2");
        QMetaObject::invokeMethod(ChartView, "setDetectionUGV2"
                                  , Q_ARG(QVariant, msg.index)
                                  , Q_ARG(QVariant, msg.objectName)
                                  , Q_ARG(QVariant, msg.pos[0])
                                  , Q_ARG(QVariant, msg.pos[1])
                                  , Q_ARG(QVariant, msg.pos[2]));
    }
}

void UAVPosition::passTheScoreToQml(int* scores){
    QQuickItem* Rectangle = getItemByObjectName("score");
    if(Rectangle){
        QMetaObject::invokeMethod(Rectangle, "setScores"
                                  , Q_ARG(QVariant, scores[0])
                                  , Q_ARG(QVariant, scores[1]));

    }
    else {
        cout << "can not find!" << std::endl;
    }

}

void UAVPosition::sendT()
{
    sendMes102(FORMATION_TRIANGLE);
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendT()));

}
void UAVPosition::sendR()
{
    sendMes102(FORMATION_RECTANGLE);
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendR()));

}
void UAVPosition::sendC()
{
    sendMes102(FORMATION_CIRCULAR);
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendC()));

}
void UAVPosition::sendY()
{
    sendMes102(FORMATION_COLUMN);
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendY()));
}

void UAVPosition::AT()
{

    auto CommandBtn = getItemByObjectName("btn3");
    connect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendT()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendY()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendR()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendC()));
}
void UAVPosition::AR()
{
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendT()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendY()));
    connect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendR()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendC()));
}
void UAVPosition::AC()
{
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendT()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendR()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendY()));
    connect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendC()));
}
void UAVPosition::AY()  //
{
    auto CommandBtn = getItemByObjectName("btn3");
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendT()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendR()));
    disconnect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendC()));
    connect(CommandBtn,SIGNAL(clicked()),this,SLOT(sendY()));
}

void UAVPosition::showDialog(){
    d1.show();
}

void UAVPosition::sendUp()
{
    sendMes102(TAKE_OFF);
}

void UAVPosition::sendDown()
{
    sendMes102(LAND);
}

void UAVPosition::sendHover(){
    sendMes102(HOVER);
}

//发送开始信息  （case 3）
void UAVPosition::sendStart(){
    sendMes104(START);
}
//发送返回信息  （case 3）
void UAVPosition::sendReturn(){
    sendMes104(RETURN);
}
//发送停止信息  （case 3）
void UAVPosition::sendStop(){
    sendMes104(STOP);
}

//发送开始信息  （case 2）
void UAVPosition::sendStart1(){
    sendMes103(0 , START, case2Pos);
}
//发送返回信息  （case 2）
void UAVPosition::sendReturn1(){
    sendMes103(0, RETURN, case2Pos);
}
//发送停止信息  （case 2）
void UAVPosition::sendStop1(){
    sendMes103(0, STOP, case2Pos);
}

void UAVPosition::connectCam(int index){
}

void UAVPosition::closeCam(int index){
}

void UAVPosition::sendMes101(int8_t index, float* pos){
    if(WThreads[index-1]->isConnect == true ){
        int len = encodeMes101(WThreads[index-1]->buff, index, pos);
        WThreads[index-1]->sendMsg(len);
    }
}
void UAVPosition::sendMes102(int8_t command){
        for(int i = 1; i <= 8; ++i){
            if(WThreads[i-1]->isConnect == true){
                int len = encodeMes102(WThreads[i-1]->buff, i , command);
                WThreads[i-1]->sendMsg(len);
            }
        }
}
void UAVPosition::sendMes103(int8_t index, int8_t command, float* pos){
    if(command == TAKE_OFF){                        //开始发八个
        for(int i = 1; i <= 8; ++i){
            if(WThreads[i-1]->isConnect == true){
                int len = encodeMes103(WThreads[i-1]->buff, i, command, pos);
                WThreads[i-1]->sendMsg(len);
            }
        }
    }
    else if(command == RETURN || command == STOP){  //停止发十个
        for(int i = 1; i <= 10; ++i){
            if(WThreads[i-1]->isConnect == true){
                int len =encodeMes103(WThreads[i-1]->buff, i, command, pos);
                WThreads[i-1]->sendMsg(len);
            }
        }
    }
    else if(command == GO){                         //出发
        if((index-1)/4 == 0){
//            for(int i = 1; i <= 4; ++i){
//                if(i == index) continue;
//                if(WThreads[i-1]->isConnect == true){
//                    int len =encodeMes103(WThreads[i-1]->buff, i, RETURN, pos);
//                    WThreads[i-1]->sendMsg(len);
//                }
//            }
            if(WThreads[8]->isConnect == true){
                int len =encodeMes103(WThreads[8]->buff, 9, GO, pos);
                WThreads[8]->sendMsg(len);
            }
        }
        else {
//            for(int i = 5; i <= 8; ++i){
//                if(i == index) continue;
//                if(WThreads[i-1]->isConnect == true){
//                    int len =encodeMes103(WThreads[i-1]->buff, i, RETURN, pos);
//                    WThreads[i-1]->sendMsg(len);
//                }
//            }
            if(WThreads[9]->isConnect == true){
                int len =encodeMes103(WThreads[9]->buff, 10, GO, pos);
                WThreads[9]->sendMsg(len);
            }
        }

    }
}
void UAVPosition::sendMes104(int8_t command){
    for(int i = 1; i <= 10; ++i){
        if(WThreads[i-1]->isConnect == true){
            int len =encodeMes104(WThreads[i-1]->buff, i, command);
            WThreads[i-1]->sendMsg(len);
        }
    }
}

int UAVPosition::encodeMes101(char* buff, int8_t index, float* pos){

    char* ptr = buff;
    int8_t HEAD = 101;
    *((int8_t *)ptr) = HEAD ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = index ;
    ptr += sizeof(int8_t);

    int8_t commandID = 1;
    *((int8_t *)ptr) = commandID;
    ptr += sizeof(int8_t);

    int8_t mode = 8;
    *((int8_t *)ptr) = mode;
    ptr += sizeof(int8_t);

    for(int i = 0 ; i < 3; ++i){
        *((float *)ptr) = (pos[i] / 100.0);
        ptr += sizeof(float);
    }

    return ptr-buff;
}
int UAVPosition::encodeMes102(char* buff, int8_t index, int8_t command){
    char* ptr = buff;
    int8_t HEAD = 102;
    *((int8_t *)ptr) = HEAD ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = index ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = command;
    ptr += sizeof(int8_t);

    return ptr-buff;
}
int UAVPosition::encodeMes103(char* buff, int8_t index, int8_t command, float* pos){
    char* ptr = buff;
    int8_t HEAD = 103;
    *((int8_t *)ptr) = HEAD ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = index ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = command;

    ptr += sizeof(int8_t);

    for(int i = 0 ; i < 3; ++i){
        *((float *)ptr) = pos[i];
        ptr += sizeof(float);
    }
    return ptr-buff;
}
int UAVPosition::encodeMes104(char* buff, int8_t index, int8_t command){
    char* ptr = buff;
    int8_t HEAD = 104;
    *((int8_t *)ptr) = HEAD ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = index ;
    ptr += sizeof(int8_t);

    *((int8_t *)ptr) = command;
    ptr += sizeof(int8_t);
    return ptr-buff;
}

void UAVPosition::startIThread1(){
    if(IThreads[0]->isConnect == 1)   IThreads[0]->start();
}

void UAVPosition::closeIThread1(){
    IThreads[0]->stop();
}
void UAVPosition::startIThread2(){
    if(IThreads[1]->isConnect == 1)   IThreads[1]->start();
}

void UAVPosition::closeIThread2(){
    IThreads[1]->stop();
}
void UAVPosition::startIThread3(){
    if(IThreads[2]->isConnect == 1)   IThreads[2]->start();
}

void UAVPosition::closeIThread3(){
    IThreads[2]->stop();
}
void UAVPosition::startIThread4(){
    if(IThreads[3]->isConnect == 1)   IThreads[3]->start();
}

void UAVPosition::closeIThread4(){
    IThreads[3]->stop();
}
void UAVPosition::startIThread5(){
    if(IThreads[4]->isConnect == 1)   IThreads[4]->start();
}

void UAVPosition::closeIThread5(){
    IThreads[4]->stop();
}
void UAVPosition::startIThread6(){
    if(IThreads[5]->isConnect == 1)   IThreads[5]->start();
}

void UAVPosition::closeIThread6(){
    IThreads[5]->stop();
}
void UAVPosition::startIThread7(){
    if(IThreads[6]->isConnect == 1)   IThreads[6]->start();
}

void UAVPosition::closeIThread7(){
    IThreads[6]->stop();
}
void UAVPosition::startIThread8(){
    if(IThreads[7]->isConnect == 1)   IThreads[7]->start();
}

void UAVPosition::closeIThread8(){
    IThreads[7]->stop();
}
void UAVPosition::startIThread9(){
    if(IThreads[8]->isConnect == 1)   IThreads[8]->start();
}

void UAVPosition::closeIThread9(){
    IThreads[8]->stop();
}
void UAVPosition::startIThread10(){
    if(IThreads[9]->isConnect == 1)   IThreads[9]->start();
}

void UAVPosition::closeIThread10(){
    IThreads[9]->stop();
}






