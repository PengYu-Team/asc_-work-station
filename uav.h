#ifndef UAV_H
#define UAV_H
#include <QMetaType>
#include <iostream>
class UAV
{
public:
    UAV();
    UAV(const UAV& u);
    ~UAV();
    float position[10] = {10.0, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0} ;
    int8_t state[3] = {0 , 0 , 0} ;

};

#endif // UAV_H
