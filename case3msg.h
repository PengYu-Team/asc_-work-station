#ifndef CASE3MSG_H
#define CASE3MSG_H
#include <QMetaType>

class case3Msg
{
public:
    case3Msg();
    ~case3Msg();
    int8_t objectName;
    int8_t movingTarget;
    int8_t score;
};

#endif // CASE3MSG_H
