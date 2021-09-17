#ifndef CASE2MSG_H
#define CASE2MSG_H
#include <QMetaType>

class case2Msg
{
public:
    case2Msg();
    ~case2Msg();
    int8_t objectName;
    int8_t movingTarget;
    int8_t index;
    float pos[3] = {0.0 , 0.0 , 0.0};
};

#endif // CASE2MSG_H
