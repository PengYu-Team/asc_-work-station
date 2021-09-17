
#ifndef MYMEDIAPLAYER_H
#define MYMEDIAPLAYER_H
#include <QMediaPlayer>
#include <QAbstractVideoSurface>

class MyMediaPlayer: public QMediaPlayer
{
Q_OBJECT
public:
    Q_PROPERTY(QAbstractVideoSurface* videoSurface READ getVideoSurface WRITE setVideoSurface )
    Q_INVOKABLE void play();
public:
    MyMediaPlayer(QObject * parent = 0, Flags flags = 0);

public slots:

    void setVideoSurface(QAbstractVideoSurface* surface);
    QAbstractVideoSurface* getVideoSurface();

private:
    QAbstractVideoSurface* m_surface;
};
#endif // MYMEDIAPLAYER_H


//Page {
//objectName: "uav8"
//id:uav8
//width:300
//height:400 + 400
//anchors.left: uav8.right
//anchors.leftMargin:  30
//Rectangle{
//    id : rectangle8p
//    width : 1/6*parent.width
//    height: 1/3 * parent.height
//    anchors.top : parent.top
//    anchors.left: parent.left
//    anchors.leftMargin:  20

//    Label{
//        id: label_x8
//        width:20
//        height:40
//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 70
//        text:"X:"
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id: text_x8
//        width:100
//        height:40
//        anchors.top: parent.top
//        anchors.left: label_x8.right
//        anchors.leftMargin: 10
//        anchors.topMargin: 69
//        text: "No Set"
//    }
//    Label{
//        id: label_y8
//        width:20
//        height:40
//        anchors.top: label_x8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"Y:"
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id:text_y8
//        width:100
//        height:40
//        anchors.top: text_x8.bottom
//        anchors.left: label_y8.right
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text: "No Set"
//    }
//    Label{
//        id:label_z8
//        width:20
//        height:40
//        anchors.top: label_y8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"Z:"
//        font.bold:  true  //字体加粗margin:20
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id:text_z8
//        width:50
//        height:40
//        anchors.top: text_y8.bottom
//        anchors.left: label_z8.right
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text: "No Set"
//    }
//}

//Rectangle{
//    id:rectangle8v
//    width : 1/5*parent.width
//    height: parent.height
//    anchors.topMargin: 0
//    anchors.top : parent.top
//    anchors.left: rectangle8p.right
//    anchors.leftMargin: 66
//    Label{
//        id:label_Vx8
//        width:20
//        height:40
//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 69
//        text:"Vx:"
//        font.bold:  true  //字体加粗margin:20
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id: text_Vx8
//        width:50
//        height:40
//        anchors.top: parent.top
//        anchors.left: label_Vx8.right
//        anchors.leftMargin: 17
//        anchors.topMargin: 70
//        text: "No Set"
//    }
//    Label{
//        id:label_Vy8
//        width:20
//        height:40
//        anchors.top: label_Vx8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"Vy:"
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id: text_Vy8
//        width:50
//        height:40
//        anchors.top: text_Vx8.bottom
//        anchors.left: label_Vy8.right
//        anchors.leftMargin: 13
//        anchors.topMargin:  10
//        text: "No Set"
//    }
//    Label{
//        id:label_Vz8
//        width:20
//        height:40
//        anchors.top: label_Vy8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"Vz:"
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id: text_Vz8
//        width:200
//        height:40
//        anchors.top: text_Vy8.bottom
//        anchors.left: label_Vz8.right
//        anchors.leftMargin: 13
//        anchors.topMargin: 10
//        text: "No Set"
//    }


//    Label {
//        id: labe_a8
//        x: 82
//        y: 238
//        width: 50.125
//        text: qsTr("Armed:")
//        font.bold: true
//        font.pixelSize: 14
//    }

//    Label {
//        id: label_b8
//        x: 81
//        y: 268
//        width: 116
//        height: 17
//        text: qsTr("Battery:")
//        font.bold: true
//        font.pixelSize: 14
//        z: 1
//    }
//}
//Rectangle{
//    id : rectangle8a
//    width : 1/4*parent.width
//    height: parent.height
//    anchors.topMargin: 0
//    anchors.top : parent.top
//    anchors.left: rectangle8v.right
//    anchors.leftMargin: 59
//    Label{
//        id: label_Ax8
//        width:20
//        height:40
//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 70
//        text:"pitch:"
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id: text_Ax8
//        width:50
//        height:40
//        anchors.top: parent.top
//        anchors.left: label_Ax8.right
//        anchors.leftMargin: 27
//        anchors.topMargin: 72
//        text: "No Set"
//    }
//    Label{
//        id: label_Ay8
//        width:20
//        height:40
//        anchors.top: label_Ax8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"yaw:  "
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id:text_Ay8
//        width:50
//        height:40
//        anchors.top: text_Ax8.bottom
//        anchors.left: label_Ay8.right
//        anchors.leftMargin: 25
//        anchors.topMargin: 10
//        text: "No Set"
//    }
//    Label{
//        id:label_Az8
//        width:20
//        height:40
//        anchors.top: label_Ay8.bottom
//        anchors.left: parent.left
//        anchors.leftMargin: 10
//        anchors.topMargin: 10
//        text:"roll: "
//        font.bold:  true  //字体加粗margin:10
//        font.pixelSize: 14  //字体大小
//    }
//    Text{
//        id:text_Az8
//        width:50
//        height:40
//        anchors.top: text_Ay8.bottom
//        anchors.left: label_Az8.right
//        anchors.leftMargin: 25
//        anchors.topMargin: 10
//        text: "No Set"
//    }

//    Text {
//        id: text_a8
//        x: 36
//        y: 240
//        text: qsTr("No Set")
//        font.pointSize: 11
//    }

//    Text {
//        id: text_b8
//        x: 38
//        y: 268
//        width: 39.5
//        height: 15
//        text: qsTr("No Set")
//        font.pointSize: 11
//    }
//}
//Rectangle{
//    visible: true
//    id : rectangle8Img
//    width: 425
//    height: 281
//    anchors.top : rectangle8p.bottom
//    anchors.topMargin:   112
//    anchors.left: parent.left
//    anchors.leftMargin:  19
//    Image{
//        id:img8;
//            width: 400
//            height: 243
//            anchors.verticalCenterOffset: 6
//            anchors.horizontalCenterOffset: 1
//            anchors.centerIn: parent;
//            cache:false;
//            source: "qrc:/camera.png"
//        }
//    Connections{
//        target: CodeImage8
//        onCallQmlRefeshImg:{
//            img8.source = "";
//            img8.source = "image://CodeImg8";
//            console.log("set8")
//        }
//    }
//}

//Label {
//    id: label_c8
//    x: 42
//    y: 237
//    text: qsTr("Connected:")
//    font.pixelSize: 14
//    font.bold: true
//}

//Text {
//    id: text_c8
//    x: 159
//    y: 237
//    text: qsTr("No Set")
//    font.pointSize: 11
//}

//Label {
//    id: label_m8
//    x: 43
//    y: 268
//    text: qsTr("Mode:")
//    font.bold: true
//    font.pixelSize: 14
//}

//Text {
//    id: text_m8
//    x: 161
//    y: 267
//    text: qsTr("No Set")
//    font.pointSize: 11
//}

//Rectangle {
//    id: rectangle8
//    x: 26
//    y: 213
//    width: 413
//    height: 98
//    color: "#00000000"
//    radius: 5
//    border.color: "#150f0f"
//}

//function setPosition8(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
//{
//    text_x8.text = Px.toFixed(8)  + " m";
//    text_y8.text = Py.toFixed(8)  + " m";
//    text_z8.text = Pz.toFixed(8)  + " m";
//    text_Vx8.text = Vx.toFixed(8) + " m/s";
//    text_Vy8.text = Vy.toFixed(8) + " m/s";
//    text_Vz8.text = Vz.toFixed(8) + " m/s";
//    text_Ax8.text = Ax.toFixed(8) + " deg";
//    text_Ay8.text = Ay.toFixed(8) + " deg";
//    text_Az8.text = Az.toFixed(8) + " deg";
//}
//function setState8(connected, armed, mode, battery){
//    text_c8.text = connected;
//    text_a8.text = armed;
//    text_m8.text = mode;
//    text_b8.text = battery;
//}

//}

