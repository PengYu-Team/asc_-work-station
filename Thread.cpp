#include "Thread.h"

RThread::RThread(QObject *parent) : QObject(parent)
{
    read_timer = new QTimer(this);
    read_thread = new QThread(this);
    reading_status = 0;

    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(8887);
    rece_sock = socket(AF_INET,SOCK_DGRAM,0);
    bind(rece_sock,(struct sockaddr *) &servaddr,sizeof(servaddr));
}

RThread::~RThread()
{
    close(rece_sock);
    delete read_timer;
    delete read_thread;
}

void RThread::start()
{
    if(!reading_status){
        createRThread();
        read_thread->start();
        reading_status = true;
    }
    else{
        emit continueTimer();
    }
}

void RThread::stop()
{
    emit stopTimer();
    reading_status = 0;
    read_thread->quit();
}

void RThread::createRThread()
{
    connect(read_thread,&QThread::started,this,&RThread::onStartTimer);
    this->moveToThread(read_thread);
}

void RThread::createTimer()
{
    connect(read_timer,&QTimer::timeout,this,&RThread::onGenerateTimeout);
    connect(this,&RThread::continueTimer,this,&RThread::onStartTimer);
    connect(this,&RThread::stopTimer,this,&RThread::onStopTimer);
    read_timer->setInterval(10);
}

void RThread::generateData()
{
    n = recvfrom(rece_sock, buff, sizeof(buff), 0,(struct sockaddr *)NULL, NULL);
    char*ptr = buff;
    int8_t HEAD = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    if(HEAD == 1){
        decodeMsg1(ptr);
        emit signalUAV(a);
    }
    else if(HEAD == 2){
        decodeMsg2(ptr);
        emit signalUGV(g);
    }
    else if(HEAD == 3){
        decodeMsg3(ptr);
        emit signalMsg1(msg1);
//        cout << "Get Msg 3" << endl;
    }
    else if(HEAD == 4){
        decodeMsg4(ptr);
        emit signalScores(scores);
    }
    else{
        printf("HEAD error");
    }
}

void RThread::onGenerateTimeout()
{
    generateData();
}

void RThread::onStartTimer()
{
    createTimer();
    read_timer->start();
}

void RThread::onStopTimer()
{
    if(read_timer) read_timer->stop();
}

void RThread::decodeMsg1(char* ptr)
{
    //UAV_ID
    index = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    if(debug == 1) printf(" index : %d\n" , index);

    //Position
    for(int i = 0 ; i<=5; ++i){
        a[index].position[i] = *((float *)ptr);
        ptr += sizeof(float);
    }
    //roll + yaw + pitch
    for(int i = 6; i<=8; ++i){
        float temp =  *((float *)ptr) *(180/3.1415926);
        a[index].position[i] = temp;
        ptr += sizeof(float);
    }

    //connected + armed + mode + B_S
    int8_t connected = *((int8_t*)ptr);
    ptr += sizeof(int8_t);  //连接
    a[index].state[0] = connected;

    int8_t armed = *((int8_t*)ptr);
    ptr += sizeof(int8_t);  //解锁
    a[index].state[1] = armed;

    int8_t mode = *((int8_t*)ptr);
    ptr += sizeof(int8_t);  //模式
    a[index].state[2] = mode;

    float battery_state = *((float*)ptr);
    ptr += sizeof(float);   //电池状态
    a[index].position[9] = battery_state;
}

void RThread::decodeMsg2(char* ptr)
{
//    cout << "decode Msg2" << endl;
    index = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    for(int i = 0 ; i<=5; ++i){
        g[index].position[i] = *((float *)ptr);
//        cout << i  << "  " <<g[index].position[i] << endl;
        ptr += sizeof(float);
    }

    //roll + yaw + pitch
    for(int i = 6; i<=8; ++i){
        float temp =  *((float *)ptr) *(180/3.1415926);
        g[index].position[i] = temp;
        ptr += sizeof(float);
    }

    int8_t connected = *((int8_t*)ptr);
    ptr += sizeof(int8_t);  //模式
    g[index].state = connected;

    float battery_state = *((float*)ptr);
    ptr += sizeof(float);   //电池状态
    g[index].position[9] = battery_state;
}

void RThread::decodeMsg3(char* ptr){
    msg1.index = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    msg1.objectName = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    msg1.movingTarget = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    for(int i = 0; i < 3; ++i){
        msg1.pos[i] = *((float*)ptr);
        ptr += sizeof(float);
    }
}

void RThread::decodeMsg4(char* ptr){

    index = *((int8_t*)ptr);
    ptr += sizeof(int8_t);
    printf("detection id :: %d \n", index);

    int8_t objectName = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    int8_t score = *((int8_t*)ptr);
    ptr += sizeof(int8_t);

    if((index - 1)/4 == 0 || index == 9){
        if(index == 9)   scoresRed[4] = score;
        else scoresRed[index-1] = score;
        scores[0] = 0;
        for(int i = 0; i < 5; ++i){
            scores[0] += scoresRed[i];
        }
    }
    else {
        if(index == 10)  scoresBlue[4] = score;
        else scoresBlue[index-5] = score;
        scores[1] = 0;
        for(int i = 0; i < 5; ++i){
            scores[1] += scoresBlue[i];
        }
    }
}


//============================客户端TCP返回指令信息线程=============================
WThread::WThread(QObject *parent, char* downUrl) : QObject(parent)
{
    servInetAddr = downUrl;
    write_thread = new QThread(this);
    write_thread->start();
    socketfd = socket(AF_INET,SOCK_STREAM,0);
    memset(&sockaddr,0,sizeof(sockaddr));
    sockaddr.sin_family = AF_INET;
    sockaddr.sin_port = htons(8888);
    inet_pton(AF_INET,servInetAddr,&sockaddr.sin_addr);
}

WThread::~WThread()
{
    close(socketfd);
    delete write_thread;
}

void WThread::createWThread()
{
    connect(this,SIGNAL(send(int)),this,SLOT(command(int)));
    this->moveToThread(write_thread);
}

void WThread::sendMsg(int len)
{
    emit send(len);
}

void WThread::command(int len)
{
    socketfd = socket(AF_INET,SOCK_STREAM,0);

    if((::connect(socketfd,(struct sockaddr*)&sockaddr,sizeof(sockaddr))) < 0 ) {
        printf("connect error %s errno: %d\n",strerror(errno),errno);
        return;
    }
    if(::send(socketfd,buff,len*sizeof(char), 0) < 0)
    {
        printf("send mes error: %s errno : %d\n",strerror(errno),errno);
    }
    memset(&buff, -1 ,sizeof(buff));

    close(socketfd);
}


//==========================Image generation and send Thread=============================
#include "Thread.h"

IThread::IThread(QObject *parent) : QObject(parent){
    read_timer = new QTimer(this);
    read_thread = new QThread(this);
    this->moveToThread(read_thread);
}

IThread::~IThread()
{
    av_free(out_buffer);
    av_free(pFrameRGB);
    avcodec_close(pCodecCtx);
    avformat_close_input(&pFormatCtx);

    delete read_timer;
    delete read_thread;
}

void IThread::connectNGINX(char* url){
        char* downUrl = url;
//        Runner input_runner = {0};
        cout << "Creating the image_thread..." <<endl;
        reading_status = 0;
        avformat_network_init();
        av_register_all();

        // Allocate an AVFormatContext.
        pFormatCtx = avformat_alloc_context();
//        pFormatCtx->interrupt_callback.callback = interrupt_callback; //超时回调函数
//        pFormatCtx->interrupt_callback.opaque = &input_runner;
//        input_runner.lasttime = time(NULL);

        AVDictionary *avdic = NULL;
        av_dict_set(&avdic, "rtsp_transport", "udp", 0);
        av_dict_set(&avdic, "max_delay", "100", 0);

        ret = avformat_open_input(&pFormatCtx, downUrl, NULL, &avdic);

        if (ret != 0 ) {
            printf("can't open the file. \n");
            return;
        }
        else if(ret == AVERROR_EOF){
            avformat_open_input(&pFormatCtx, downUrl, NULL, &avdic);
        }

        //控制超时回调函数的关闭
        callback_flag = 1;

        if (avformat_find_stream_info(pFormatCtx, NULL) < 0) {
            return;
        }

        videoStream = -1;

        for (i = 0; i < pFormatCtx->nb_streams; i++) {
            if (pFormatCtx->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO) {
                videoStream = i;
            }
        }

        if (videoStream == -1) {
            cout << "can't find the videoStream!" << endl;
            return;
        }

        // 查找解码器
        pCodecCtx = pFormatCtx->streams[videoStream]->codec;
        pCodec = avcodec_find_decoder(pCodecCtx->codec_id);

        pCodecCtx->bit_rate = 0;       // 初始化为
        pCodecCtx->time_base.num = 1;  // 下面两行：一秒钟25帧
        pCodecCtx->time_base.den = 10; //
        pCodecCtx->frame_number = 1;   // 每包一个视频帧

        if (pCodec == NULL) {
            return;
        }

        // 打开解码器
        if (avcodec_open2(pCodecCtx, pCodec, NULL) < 0) {
            return;
        }

        pFrame = av_frame_alloc();
        pFrameRGB = av_frame_alloc();

        // 这里我们改成了 将解码后的YUV数据转换成RGB32
        img_convert_ctx = sws_getContext(pCodecCtx->width, pCodecCtx->height,
            pCodecCtx->pix_fmt, pCodecCtx->width, pCodecCtx->height,
            AV_PIX_FMT_RGB32, SWS_BICUBIC, NULL, NULL, NULL);

        numBytes = avpicture_get_size(AV_PIX_FMT_RGB32, pCodecCtx->width,pCodecCtx->height);

        out_buffer = (uint8_t *) av_malloc(numBytes * sizeof(uint8_t));
        avpicture_fill((AVPicture *) pFrameRGB, out_buffer, AV_PIX_FMT_RGB32,
            pCodecCtx->width, pCodecCtx->height);
        int y_size = pCodecCtx->width * pCodecCtx->height;

        packet = (AVPacket *) malloc(sizeof(AVPacket));  //分配一个packet
        av_new_packet(packet, y_size);

        isConnect = 1;
}

void IThread::start()
{
    if(!reading_status){
        createIThread();
        read_thread->start();
        reading_status = true;
    }
    else{
        emit continueTimer();
    }
}

void IThread::stop()
{
    read_thread->quit();
    emit stopTimer();
    reading_status = 0;
}

void IThread::createIThread()
{
    connect(read_thread,&QThread::started,this,&IThread::onStartTimer);
//    this->moveToThread(read_thread);
}

void IThread::createTimer()
{
    connect(read_timer,&QTimer::timeout,this,&IThread::onGenerateTimeout);
    connect(this,&IThread::continueTimer,this,&IThread::onStartTimer);
    connect(this,&IThread::stopTimer,this,&IThread::onStopTimer);
    read_timer->setInterval(10);
}

void IThread::generateData()
{
    int ret = av_read_frame(pFormatCtx, packet) ;

    if (ret < 0)
    {
        return;
    }

    if (packet->stream_index == videoStream) {
        ret = avcodec_decode_video2(pCodecCtx, pFrame, &got_picture, packet);
        if (ret < 0) {
            return;
        }

        if (got_picture) {
            sws_scale(img_convert_ctx,
                (uint8_t const * const *) pFrame->data,
                pFrame->linesize, 0, pCodecCtx->height, pFrameRGB->data,
                pFrameRGB->linesize);

            // 把这个RGB数据 用QImage加载
            QImage tmpImg((uchar *)out_buffer, pCodecCtx->width, pCodecCtx->height, QImage::Format_RGB32);  // 把图像复制一份 传递给界面显示
            Ithread_img = tmpImg.copy();
            emit signalQImage(Ithread_img);
        }
    av_free_packet(packet);
    }

}

void IThread::onGenerateTimeout()
{
    generateData();
}

void IThread::onStartTimer()
{
    createTimer();
    read_timer->start();
}

void IThread::onStopTimer()
{
    if(read_timer)
        read_timer->stop();
}

cv::Mat IThread::QImage2cvMat(QImage image)
{
    cv::Mat mat;
    qDebug() << image.format();
    switch(image.format())
    {
    case QImage::Format_ARGB32:
    case QImage::Format_RGB32:
    case QImage::Format_ARGB32_Premultiplied:
        mat = cv::Mat(image.height(), image.width(), CV_8UC4, (void*)image.constBits(), image.bytesPerLine());
        break;
    case QImage::Format_RGB888:
        mat = cv::Mat(image.height(), image.width(), CV_8UC3, (void*)image.constBits(), image.bytesPerLine());
        cv::cvtColor(mat, mat, CV_BGR2RGB);
        break;
    case QImage::Format_Indexed8:
        mat = cv::Mat(image.height(), image.width(), CV_8UC1, (void*)image.constBits(), image.bytesPerLine());
        break;
    }
    return mat;
}


