#include "myDialog.h"

myDialog::myDialog(QWidget *parent) : QDialog(parent)
{
    this->setWindowTitle("SendMes");
    this->setGeometry(800,500,400,200);

    Editid = new  QLineEdit(this);
    Editid->setPlaceholderText("请输入无人机ID....(1~10)");
    Editid->setValidator(new QIntValidator(1, 10, this));
    Editid->setGeometry(50,40,220,20);
    Editid->show();

    Editx = new  QLineEdit(this);
    Editx->setPlaceholderText("xxxxxx");
    Editx->setGeometry(50,80,50,20);
    Editx->show();
    Edity = new  QLineEdit(this);
    Edity->setPlaceholderText("yyyyyy");
    Edity->setGeometry(120,80,50,20);
    Edity->show();
    Editz = new  QLineEdit(this);
    Editz->setPlaceholderText("zzzzzz");
    Editz->setGeometry(190,80,50,20);
    Editz->show();

    Btn = new QPushButton(this);
    Btn->setText("Send");
    Btn->move(150,150);
    Btn->show();

    connect(Btn,SIGNAL(clicked()),this,SLOT(sendMes()));
}

void myDialog::sendMes(){
    Eid = Editid->text();
    Ex = Editx->text();
    Ey = Edity->text();
    Ez = Editz->text();


    index = Eid.toInt();
    cout << "Ex: " << FloatCheck(Ex) ;
    cout << "Ey: " << FloatCheck(Ey) ;
    cout << "Ez: " << FloatCheck(Ez) ;
    if(FloatCheck(Ex) && FloatCheck(Ey) && FloatCheck(Ez) ){
        input = false;
        pos[0] = Ex.toDouble();
        pos[1] = Ey.toDouble();
        pos[2] = Ez.toDouble();
        for(int i = 0; i < 3; ++i){
            if(pos[i] < -20 || pos[i] > 20){
                return;
            }
        }
        input = true;
    }
}

//判断输入是否为float
int myDialog::FloatCheck(QString float_str)
{
    QByteArray ba = float_str.toLatin1();//QString 转换为 char*
    const char *str = ba.data();

    int dotNum = 0;
    int dotIdx = 0;
    int Idx = 0;
    while(*str)
    {
        Idx++;
        if(*str == '.')
        {
            dotIdx = Idx;   //dot
            dotNum++;   	//dot个数统计
            if(dotNum > 1)  //小数点个数超过1
                return 0;
            else if((dotNum == 0 && dotIdx) || (dotNum == 1 && dotIdx == 1))    //无小数点
            {
                return 1;
            }
        }
        if(*str != '.')
        {
            if((*str < '0' || *str > '9') && *str != '-')
                return 0;
        }
        str++;
    }
    return 1;
}




