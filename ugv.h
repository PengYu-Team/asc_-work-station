#ifndef UGV_H
#define UGV_H
#include <QMetaType>
class UGV
{
public:
    UGV();
    ~UGV();
    float position[10] = {10.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0} ;
    int8_t state = 0;
};

#endif // UGV_H
