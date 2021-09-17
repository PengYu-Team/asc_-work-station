import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtCharts 2.2
import QtMultimedia 5.8

Rectangle {
    id: root
    visible: true
    width: 1800
    height: 1000
    color: "#f3f3f3"
    border.color: "#f6f6f6"
    clip: false
    Rectangle{
        id : img
        x: 6
        y: 14
        width: 512
        height: 80
        color: "#f7f6f6"
        border.color: "#817e7e"
        Image{
            id:imgTittle;
            width: 496
            height: 70
            clip: true
                anchors.topMargin: 5
                anchors.verticalCenterOffset: -1
                anchors.horizontalCenterOffset: 0
                anchors.centerIn: parent;
                cache:false;
                source: "qrc:/ASC.png"
            }
    }

    //无人机姿态
    GroupBox {
        id:groupbox_attitude
        width: 535
        height: 650
        spacing: 7
        wheelEnabled: false
        anchors.leftMargin: 6
        anchors.topMargin: 14
        title: "无人机姿态"
//        anchors.top:parent.top
        anchors.top:img.bottom
        anchors.left:parent.left

        SwipeView {
            id: view
            anchors.rightMargin: 0
            anchors.bottomMargin: 6
            anchors.leftMargin: 0
            anchors.topMargin: -2
            anchors.fill:parent
            //anchors.margins:5
            currentIndex: tabBar.currentIndex
            anchors.margins: 5

            Page {
                objectName: "uav1"
                id:uav1
                width:300
                height:400 + 400
                Rectangle{
                    id : rectangle1p
                    width : 1/6*parent.width
                    height: 1/3 * parent.height
                    anchors.top : parent.top
                    anchors.left: parent.left
                    anchors.leftMargin:  20

                    Label{
                        id: label_x1
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"X:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_x1
                        width:100
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_x1.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text: " 00.00"
                    }
                    Label{
                        id: label_y1
                        width:20
                        height:40
                        anchors.top: label_x1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Y:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_y1
                        width:100
                        height:40
                        anchors.top: text_x1.bottom
                        anchors.left: label_y1.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_z1
                        width:20
                        height:40
                        anchors.top: label_y1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Z:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_z1
                        width:50
                        height:40
                        anchors.top: text_y1.bottom
                        anchors.left: label_z1.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                }

                Rectangle{
                    id:rectangle1v
                    width : 1/5*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle1p.right
                    anchors.leftMargin: 66
                    Label{
                        id:label_Vx1
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text:"Vx:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vx1
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Vx1.right
                        anchors.leftMargin: 16
                        anchors.topMargin: 70
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vy1
                        width:20
                        height:40
                        anchors.top: label_Vx1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vy:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vy1
                        width:50
                        height:40
                        anchors.top: text_Vx1.bottom
                        anchors.left: label_Vy1.right
                        anchors.leftMargin: 13
                        anchors.topMargin:  10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vz1
                        width:20
                        height:40
                        anchors.top: label_Vy1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vz:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vz1
                        width:100
                        height:40
                        anchors.top: text_Vy1.bottom
                        anchors.left: label_Vz1.right
                        anchors.leftMargin: 13
                        anchors.topMargin: 10
                        text: " 00.00"
                    }


                    Label {
                        id: label
                        x: 82
                        y: 238
                        width: 50.125
                        text: qsTr("Armed:")
                        font.bold: true
                        font.pixelSize: 14
                    }

                    Label {
                        id: label2
                        x: 81
                        y: 268
                        width: 116
                        height: 17
                        text: qsTr("Battery:")
                        font.bold: true
                        font.pixelSize: 14
                        z: 1
                    }
                }
                Rectangle{
                    id : rectangle1a
                    width : 1/4*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle1v.right
                    anchors.leftMargin: 59
                    Label{
                        id: label_Ax1
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"roll:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Ax1
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Ax1.right
                        anchors.leftMargin: 27
                        anchors.topMargin: 72
                        text: " 00.00"
                    }
                    Label{
                        id: label_Ay1
                        width:20
                        height:40
                        anchors.top: label_Ax1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"pitch:  "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Ay1
                        width:50
                        height:40
                        anchors.top: text_Ax1.bottom
                        anchors.left: label_Ay1.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Az1
                        width:20
                        height:40
                        anchors.top: label_Ay1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"yaw: "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Az1
                        width:50
                        height:40
                        anchors.top: text_Ay1.bottom
                        anchors.left: label_Az1.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }

                    Text {
                        id: text_a1
                        x: 36
                        y: 240
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }

                    Text {
                        id: text_b1
                        x: 38
                        y: 268
                        width: 39.5
                        height: 15
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }
                }
                Rectangle{
                    visible: true
                    id : rectangle1Img
                    width: 425
                    height: 260
                    anchors.top : rectangle1p.bottom
                    anchors.topMargin:   122
                    anchors.left: parent.left
                    anchors.leftMargin:  22
                    Image{
                        id:img1;
                            width: 400
                            height: 243
                            anchors.verticalCenterOffset: 1
                            anchors.horizontalCenterOffset: 0
                            anchors.centerIn: parent;
                            cache: false;
                            source: "qrc:/camera.png"
                        }
                    Connections{
                        target: CodeImage1
                        onCallQmlRefeshImg:{
                            img1.source = "";
                            img1.source = "image://CodeImg1";
//                            console.log("set1")
                        }
                    }
                }

                Button{
                    id: openBtn1
                    objectName: "openBtn1"
                    text: "ON"
                    width:61
                    height:31
                    anchors.top:parent.top
                    anchors.left:rectangle1Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 504
                }
                Button{
                    id: closeBtn1
                    objectName: "closeBtn1"
                    text: "OFF"
                    width:61
                    height:31
                    anchors.top:openBtn1.bottom
                    anchors.left:rectangle1Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 10
                    Connections{
                        target: closeBtn1
                        onClicked:{
                            img1.source ="qrc:/camera.png"
                            console.log("reset1")
                        }
                    }
                }

                Label {
                    id: label_c1
                    x: 42
                    y: 237
                    text: qsTr("Connected:")
                    font.pixelSize: 14
                    font.bold: true
                }

                Text {
                    id: text_c1
                    x: 159
                    y: 237
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Label {
                    id: label1
                    x: 43
                    y: 268
                    text: qsTr("Mode:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Text {
                    id: text_m1
                    x: 161
                    y: 267
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Rectangle {
                    id: rectangle
                    x: 26
                    y: 213
                    width: 413
                    height: 98
                    color: "#00000000"
                    radius: 5
                    border.color: "#150f0f"
                }

                function setPosition1(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
                {
                    text_x1.text = Px.toFixed(2)  + " m";
                    text_y1.text = Py.toFixed(2)  + " m";
                    text_z1.text = Pz.toFixed(2)  + " m";
                    text_Vx1.text = Vx.toFixed(2) + " m/s";
                    text_Vy1.text = Vy.toFixed(2) + " m/s";
                    text_Vz1.text = Vz.toFixed(2) + " m/s";
                    text_Ax1.text = Ax.toFixed(2) + " deg";
                    text_Ay1.text = Ay.toFixed(2) + " deg";
                    text_Az1.text = Az.toFixed(2) + " deg";
                }
                function setState1(connected, armed, mode, battery){
                    if(connected === 0) text_c1.text = "FALSE";
                    else text_c1.text = "TRUE";

                    if(armed === 0) text_a1.text = "FALSE";
                    else text_a1.text = "TRUE";

                    if(mode === 0)   text_m1.text = "MANUAL";
                    else if(mode === 1) text_m1.text = "OFFBOARD";
                    else if(mode === 2) text_m1.text = "STABLIZED";
                    else if(mode === 4) text_m1.text = "ALTCTL";
                    else if(mode === 5) text_m1.text = "POSCTL";
                    else text_m1.text = "OTHERS";

                    text_b1.text = battery.toFixed(2) + " V";
                }

            }

            Page {
                objectName: "uav2"
                id:uav2
                width:300
                height:400 + 400
                anchors.left: uav1.right
                anchors.leftMargin:  60
                Rectangle{
                    id : rectangle2p
                    width : 1/6*parent.width
                    height: 1/3 * parent.height
                    anchors.top : parent.top
                    anchors.left: parent.left
                    anchors.leftMargin:  20

                    Label{
                        id: label_x2
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"X:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_x2
                        width:100
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_x2.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text: " 00.00"
                    }
                    Label{
                        id: label_y2
                        width:20
                        height:40
                        anchors.top: label_x2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Y:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_y2
                        width:100
                        height:40
                        anchors.top: text_x2.bottom
                        anchors.left: label_y2.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_z2
                        width:20
                        height:40
                        anchors.top: label_y2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Z:"
                        font.bold:  true  //字体加粗margin:20
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_z2
                        width:50
                        height:40
                        anchors.top: text_y2.bottom
                        anchors.left: label_z2.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                }

                Rectangle{
                    id:rectangle2v
                    width : 1/5*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle2p.right
                    anchors.leftMargin: 66
                    Label{
                        id:label_Vx2
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text:"Vx:"
                        font.bold:  true  //字体加粗margin:20
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vx2
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Vx2.right
                        anchors.leftMargin: 16
                        anchors.topMargin: 70
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vy2
                        width:20
                        height:40
                        anchors.top: label_Vx2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vy:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vy2
                        width:50
                        height:40
                        anchors.top: text_Vx2.bottom
                        anchors.left: label_Vy2.right
                        anchors.leftMargin: 13
                        anchors.topMargin:  10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vz2
                        width:20
                        height:40
                        anchors.top: label_Vy2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vz:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vz2
                        width:200
                        height:40
                        anchors.top: text_Vy2.bottom
                        anchors.left: label_Vz2.right
                        anchors.leftMargin: 13
                        anchors.topMargin: 10
                        text: " 00.00"
                    }


                    Label {
                        id: labe_a2
                        x: 82
                        y: 238
                        width: 50.125
                        text: qsTr("Armed:")
                        font.bold: true
                        font.pixelSize: 14
                    }

                    Label {
                        id: label_b2
                        x: 81
                        y: 268
                        width: 116
                        height: 17
                        text: qsTr("Battery:")
                        font.bold: true
                        font.pixelSize: 14
                        z: 1
                    }
                }
                Rectangle{
                    id : rectangle2a
                    width : 1/4*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle2v.right
                    anchors.leftMargin: 59
                    Label{
                        id: label_Ax2
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"roll:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Ax2
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Ax2.right
                        anchors.leftMargin: 27
                        anchors.topMargin: 72
                        text: " 00.00"
                    }
                    Label{
                        id: label_Ay2
                        width:20
                        height:40
                        anchors.top: label_Ax2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"pitch:  "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Ay2
                        width:50
                        height:40
                        anchors.top: text_Ax2.bottom
                        anchors.left: label_Ay2.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Az2
                        width:20
                        height:40
                        anchors.top: label_Ay2.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"yaw: "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Az2
                        width:50
                        height:40
                        anchors.top: text_Ay2.bottom
                        anchors.left: label_Az2.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }

                    Text {
                        id: text_a2
                        x: 36
                        y: 240
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }

                    Text {
                        id: text_b2
                        x: 38
                        y: 268
                        width: 39.5
                        height: 15
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }
                }
                Rectangle{
                    visible: true
                    id : rectangle2Img
                    width: 425
                    height: 260
                    anchors.top : rectangle2p.bottom
                    anchors.topMargin:   122
                    anchors.left: parent.left
                    anchors.leftMargin:  19
                    Image{
                        id:img2;
                            width: 400
                            height: 243
                            anchors.verticalCenterOffset: 6
                            anchors.horizontalCenterOffset: 1
                            anchors.centerIn: parent;
                            cache:false;
                            source: "qrc:/camera.png"
                        }
                    Connections{
                        target: CodeImage2
                        onCallQmlRefeshImg:{
                            img2.source = "";
                            img2.source = "image://CodeImg2";
//                            console.log("set2")
                        }
                    }
                }
                Button{
                    id: openBtn2
                    objectName: "openBtn2"
                    text: "ON"
                    width:61
                    height:31
                    anchors.top:parent.top
                    anchors.left:rectangle2Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 504
                }
                Button{
                    id: closeBtn2
                    objectName: "closeBtn2"
                    text: "OFF"
                    width:61
                    height:31
                    anchors.top:openBtn2.bottom
                    anchors.left:rectangle2Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 10
                    Connections{
                        target: closeBtn2
                        onClicked:{
                            img2.source ="qrc:/camera.png"
                            console.log("reset2")
                        }
                    }
                }
                Label {
                    id: label_c2
                    x: 42
                    y: 237
                    text: qsTr("Connected:")
                    font.pixelSize: 14
                    font.bold: true
                }

                Text {
                    id: text_c2
                    x: 159
                    y: 237
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Label {
                    id: label_m2
                    x: 43
                    y: 268
                    text: qsTr("Mode:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Text {
                    id: text_m2
                    x: 161
                    y: 267
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Rectangle {
                    id: rectangle2
                    x: 26
                    y: 213
                    width: 413
                    height: 98
                    color: "#00000000"
                    radius: 5
                    border.color: "#150f0f"
                }

                function setPosition2(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
                {
                    text_x2.text = Px.toFixed(2)  + " m";
                    text_y2.text = Py.toFixed(2)  + " m";
                    text_z2.text = Pz.toFixed(2)  + " m";
                    text_Vx2.text = Vx.toFixed(2) + " m/s";
                    text_Vy2.text = Vy.toFixed(2) + " m/s";
                    text_Vz2.text = Vz.toFixed(2) + " m/s";
                    text_Ax2.text = Ax.toFixed(2) + " deg";
                    text_Ay2.text = Ay.toFixed(2) + " deg";
                    text_Az2.text = Az.toFixed(2) + " deg";
                }
                function setState2(connected, armed, mode, battery){
                    if(connected === 0) text_c2.text = "FALSE";
                    else text_c2.text = "TRUE";

                    if(armed === 0) text_a2.text = "FALSE";
                    else text_a2.text = "TRUE";

                    if(mode === 0)   text_m2.text = "MANUAL";
                    else if(mode === 1) text_m2.text = "OFFBOARD";
                    else if(mode === 2) text_m2.text = "STABLIZED";
                    else if(mode === 4) text_m2.text = "ALTCTL";
                    else if(mode === 5) text_m2.text = "POSCTL";
                    else text_m2.text = "OTHERS";

                    text_b2.text = battery.toFixed(2) + " V";
                }

            }
            Page {
            objectName: "uav3"
            id:uav3
            width:300
            height:400 + 400
            anchors.left: uav2.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle3p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x3
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x3
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x3.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y3
                    width:20
                    height:40
                    anchors.top: label_x3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y3
                    width:100
                    height:40
                    anchors.top: text_x3.bottom
                    anchors.left: label_y3.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z3
                    width:20
                    height:40
                    anchors.top: label_y3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z3
                    width:50
                    height:40
                    anchors.top: text_y3.bottom
                    anchors.left: label_z3.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle3v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle3p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx3
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx3
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx3.right
                    anchors.leftMargin: 16
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy3
                    width:20
                    height:40
                    anchors.top: label_Vx3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy3
                    width:50
                    height:40
                    anchors.top: text_Vx3.bottom
                    anchors.left: label_Vy3.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz3
                    width:20
                    height:40
                    anchors.top: label_Vy3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz3
                    width:200
                    height:40
                    anchors.top: text_Vy3.bottom
                    anchors.left: label_Vz3.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a3
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b3
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle3a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle3v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax3
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax3
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax3.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay3
                    width:20
                    height:40
                    anchors.top: label_Ax3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay3
                    width:50
                    height:40
                    anchors.top: text_Ax3.bottom
                    anchors.left: label_Ay3.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az3
                    width:20
                    height:40
                    anchors.top: label_Ay3.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az3
                    width:50
                    height:40
                    anchors.top: text_Ay3.bottom
                    anchors.left: label_Az3.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a3
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b3
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle3Img
                width: 425
                height: 260
                anchors.top : rectangle3p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img3;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage3
                    onCallQmlRefeshImg:{
                        img3.source = "";
                        img3.source = "image://CodeImg3";
                        console.log("set3")
                    }
                }
            }
            Button{
                id: openBtn3
                objectName: "openBtn3"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle3Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn3
                objectName: "closeBtn3"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn3.bottom
                anchors.left:rectangle3Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn3
                    onClicked:{
                        img3.source ="qrc:/camera.png"
                        console.log("reset3")
                    }
                }
            }

            Label {
                id: label_c3
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c3
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m3
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m3
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle3
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition3(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x3.text = Px.toFixed(2)  + " m";
                text_y3.text = Py.toFixed(2)  + " m";
                text_z3.text = Pz.toFixed(2)  + " m";
                text_Vx3.text = Vx.toFixed(2) + " m/s";
                text_Vy3.text = Vy.toFixed(2) + " m/s";
                text_Vz3.text = Vz.toFixed(2) + " m/s";
                text_Ax3.text = Ax.toFixed(2) + " deg";
                text_Ay3.text = Ay.toFixed(2) + " deg";
                text_Az3.text = Az.toFixed(2) + " deg";
            }
            function setState3(connected, armed, mode, battery){
                if(connected === 0) text_c3.text = "FALSE";
                else text_c3.text = "TRUE";

                if(armed === 0) text_a3.text = "FALSE";
                else text_a3.text = "TRUE";

                if(mode === 0)   text_m3.text = "MANUAL";
                else if(mode === 1) text_m3.text = "OFFBOARD";
                else if(mode === 2) text_m3.text = "STABLIZED";
                else if(mode === 4) text_m3.text = "ALTCTL";
                else if(mode === 5) text_m3.text = "POSCTL";
                else text_m3.text = "OTHERS";

                text_b3.text = battery.toFixed(2) + " V";
            }

            }
            Page {
            objectName: "uav4"
            id:uav4
            width:300
            height:400 + 400
            anchors.left: uav3.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle4p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x4
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x4
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x4.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y4
                    width:20
                    height:40
                    anchors.top: label_x4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y4
                    width:100
                    height:40
                    anchors.top: text_x4.bottom
                    anchors.left: label_y4.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z4
                    width:20
                    height:40
                    anchors.top: label_y4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z4
                    width:50
                    height:40
                    anchors.top: text_y4.bottom
                    anchors.left: label_z4.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle4v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle4p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx4
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx4
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx4.right
                    anchors.leftMargin: 16
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy4
                    width:20
                    height:40
                    anchors.top: label_Vx4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy4
                    width:50
                    height:40
                    anchors.top: text_Vx4.bottom
                    anchors.left: label_Vy4.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz4
                    width:20
                    height:40
                    anchors.top: label_Vy4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz4
                    width:200
                    height:40
                    anchors.top: text_Vy4.bottom
                    anchors.left: label_Vz4.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a4
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b4
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle4a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle4v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax4
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax4
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax4.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay4
                    width:20
                    height:40
                    anchors.top: label_Ax4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay4
                    width:50
                    height:40
                    anchors.top: text_Ax4.bottom
                    anchors.left: label_Ay4.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az4
                    width:20
                    height:40
                    anchors.top: label_Ay4.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az4
                    width:50
                    height:40
                    anchors.top: text_Ay4.bottom
                    anchors.left: label_Az4.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a4
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b4
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle4Img
                width: 425
                height: 260
                anchors.top : rectangle4p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img4;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage4
                    onCallQmlRefeshImg:{
                        img4.source = "";
                        img4.source = "image://CodeImg4";
//                        console.log("set4")
                    }
                }
            }
            Button{
                id: openBtn4
                objectName: "openBtn4"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle4Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn4
                objectName: "closeBtn4"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn4.bottom
                anchors.left:rectangle4Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn4
                    onClicked:{
                        img4.source ="qrc:/camera.png"
                        console.log("reset4")
                    }
                }
            }

            Label {
                id: label_c4
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c4
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m4
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m4
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle4
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition4(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x4.text = Px.toFixed(2)  + " m";
                text_y4.text = Py.toFixed(2)  + " m";
                text_z4.text = Pz.toFixed(2)  + " m";
                text_Vx4.text = Vx.toFixed(2) + " m/s";
                text_Vy4.text = Vy.toFixed(2) + " m/s";
                text_Vz4.text = Vz.toFixed(2) + " m/s";
                text_Ax4.text = Ax.toFixed(2) + " deg";
                text_Ay4.text = Ay.toFixed(2) + " deg";
                text_Az4.text = Az.toFixed(2) + " deg";
            }
            function setState4(connected, armed, mode, battery){

                if(connected === 0) text_c4.text = "FALSE";
                else text_c4.text = "TRUE";

                if(armed === 0) text_a4.text = "FALSE";
                else text_a4.text = "TRUE";

                if(mode === 0)   text_m4.text = "MANUAL";
                else if(mode === 1) text_m4.text = "OFFBOARD";
                else if(mode === 2) text_m4.text = "STABLIZED";
                else if(mode === 4) text_m4.text = "ALTCTL";
                else if(mode === 5) text_m4.text = "POSCTL";
                else text_m4.text = "OTHERS";

                text_b4.text = battery.toFixed(2) + " V";
            }
            }

            Page {
            objectName: "uav5"
            id:uav5
            width:300
            height:400 + 400
            anchors.left: uav4.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle5p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x5
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x5
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x5.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y5
                    width:20
                    height:40
                    anchors.top: label_x5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y5
                    width:100
                    height:40
                    anchors.top: text_x5.bottom
                    anchors.left: label_y5.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z5
                    width:20
                    height:40
                    anchors.top: label_y5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z5
                    width:50
                    height:40
                    anchors.top: text_y5.bottom
                    anchors.left: label_z5.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle5v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle5p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx5
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx5
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx5.right
                    anchors.leftMargin: 16
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy5
                    width:20
                    height:40
                    anchors.top: label_Vx5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy5
                    width:50
                    height:40
                    anchors.top: text_Vx5.bottom
                    anchors.left: label_Vy5.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz5
                    width:20
                    height:40
                    anchors.top: label_Vy5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz5
                    width:200
                    height:40
                    anchors.top: text_Vy5.bottom
                    anchors.left: label_Vz5.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a5
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b5
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle5a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle5v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax5
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax5
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax5.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay5
                    width:20
                    height:40
                    anchors.top: label_Ax5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay5
                    width:50
                    height:40
                    anchors.top: text_Ax5.bottom
                    anchors.left: label_Ay5.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az5
                    width:20
                    height:40
                    anchors.top: label_Ay5.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az5
                    width:50
                    height:40
                    anchors.top: text_Ay5.bottom
                    anchors.left: label_Az5.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a5
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b5
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle5Img
                width: 425
                height: 260
                anchors.top : rectangle5p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img5;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage5
                    onCallQmlRefeshImg:{
                        img5.source = "";
                        img5.source = "image://CodeImg5";
//                        console.log("set5")
                    }
                }
            }
            Button{
                id: openBtn5
                objectName: "openBtn5"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle5Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn5
                objectName: "closeBtn5"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn5.bottom
                anchors.left:rectangle5Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn5
                    onClicked:{
                        img1.source ="qrc:/camera.png"
                        console.log("reset5")
                    }
                }
            }

            Label {
                id: label_c5
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c5
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m5
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m5
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle5
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition5(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x5.text = Px.toFixed(2)  + " m";
                text_y5.text = Py.toFixed(2)  + " m";
                text_z5.text = Pz.toFixed(2)  + " m";
                text_Vx5.text = Vx.toFixed(2) + " m/s";
                text_Vy5.text = Vy.toFixed(2) + " m/s";
                text_Vz5.text = Vz.toFixed(2) + " m/s";
                text_Ax5.text = Ax.toFixed(2) + " deg";
                text_Ay5.text = Ay.toFixed(2) + " deg";
                text_Az5.text = Az.toFixed(2) + " deg";
            }
            function setState5(connected, armed, mode, battery){
                if(connected === 0) text_c5.text = "FALSE";
                else text_c5.text = "TRUE";
                if(armed === 0) text_a5.text = "FALSE";
                else text_a5.text = "TRUE";
                if(mode === 0)   text_m5.text = "MANUAL";
                else if(mode === 1) text_m5.text = "OFFBOARD";
                else if(mode === 2) text_m5.text = "STABLIZED";
                else if(mode === 4) text_m5.text = "ALTCTL";
                else if(mode === 5) text_m5.text = "POSCTL";
                else text_m5.text = "OTHERS";
                text_b5.text = battery.toFixed(2) + " V";
            }

            }
            Page {
            objectName: "uav6"
            id:uav6
            width:300
            height:400 + 400
            anchors.left: uav5.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle6p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x6
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x6
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x6.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y6
                    width:20
                    height:40
                    anchors.top: label_x6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y6
                    width:100
                    height:40
                    anchors.top: text_x6.bottom
                    anchors.left: label_y6.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z6
                    width:20
                    height:40
                    anchors.top: label_y6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z6
                    width:50
                    height:40
                    anchors.top: text_y6.bottom
                    anchors.left: label_z6.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle6v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle6p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx6
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx6
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx6.right
                    anchors.leftMargin: 16
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy6
                    width:20
                    height:40
                    anchors.top: label_Vx6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy6
                    width:50
                    height:40
                    anchors.top: text_Vx6.bottom
                    anchors.left: label_Vy6.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz6
                    width:20
                    height:40
                    anchors.top: label_Vy6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz6
                    width:200
                    height:40
                    anchors.top: text_Vy6.bottom
                    anchors.left: label_Vz6.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a6
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b6
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle6a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle6v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax6
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax6
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax6.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay6
                    width:20
                    height:40
                    anchors.top: label_Ax6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay6
                    width:50
                    height:40
                    anchors.top: text_Ax6.bottom
                    anchors.left: label_Ay6.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az6
                    width:20
                    height:40
                    anchors.top: label_Ay6.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az6
                    width:50
                    height:40
                    anchors.top: text_Ay6.bottom
                    anchors.left: label_Az6.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a6
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b6
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle6Img
                width: 425
                height: 260
                anchors.top : rectangle6p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img6;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage6
                    onCallQmlRefeshImg:{
                        img6.source = "";
                        img6.source = "image://CodeImg6";
//                        console.log("set6")
                    }
                }
            }
            Button{
                id: openBtn6
                objectName: "openBtn6"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle6Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn6
                objectName: "closeBtn6"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn6.bottom
                anchors.left:rectangle6Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn6
                    onClicked:{
                        img6.source ="qrc:/camera.png"
                        console.log("reset6")
                    }
                }
            }

            Label {
                id: label_c6
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c6
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m6
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m6
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle6
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition6(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x6.text = Px.toFixed(2)  + " m";
                text_y6.text = Py.toFixed(2)  + " m";
                text_z6.text = Pz.toFixed(2)  + " m";
                text_Vx6.text = Vx.toFixed(2) + " m/s";
                text_Vy6.text = Vy.toFixed(2) + " m/s";
                text_Vz6.text = Vz.toFixed(2) + " m/s";
                text_Ax6.text = Ax.toFixed(2) + " deg";
                text_Ay6.text = Ay.toFixed(2) + " deg";
                text_Az6.text = Az.toFixed(2) + " deg";
            }
            function setState6(connected, armed, mode, battery){
                if(connected === 0) text_c6.text = "FALSE";
                else text_c6.text = "TRUE";
                if(armed === 0) text_a6.text = "FALSE";
                else text_a6.text = "TRUE";
                if(mode === 0)   text_m6.text = "MANUAL";
                else if(mode === 1) text_m6.text = "OFFBOARD";
                else if(mode === 2) text_m6.text = "STABLIZED";
                else if(mode === 4) text_m6.text = "ALTCTL";
                else if(mode === 5) text_m6.text = "POSCTL";
                else text_m6.text = "OTHERS";
                text_b6.text = battery.toFixed(2) + " V";
            }

            }
            Page {
            objectName: "uav7"
            id:uav7
            width:300
            height:400 + 400
            anchors.left: uav6.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle7p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x7
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x7
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x7.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y7
                    width:20
                    height:40
                    anchors.top: label_x7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y7
                    width:100
                    height:40
                    anchors.top: text_x7.bottom
                    anchors.left: label_y7.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z7
                    width:20
                    height:40
                    anchors.top: label_y7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z7
                    width:50
                    height:40
                    anchors.top: text_y7.bottom
                    anchors.left: label_z7.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle7v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle7p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx7
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx7
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx7.right
                    anchors.leftMargin: 17
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy7
                    width:20
                    height:40
                    anchors.top: label_Vx7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy7
                    width:50
                    height:40
                    anchors.top: text_Vx7.bottom
                    anchors.left: label_Vy7.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz7
                    width:20
                    height:40
                    anchors.top: label_Vy7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz7
                    width:200
                    height:40
                    anchors.top: text_Vy7.bottom
                    anchors.left: label_Vz7.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a7
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b7
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle7a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle7v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax7
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax7
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax7.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay7
                    width:20
                    height:40
                    anchors.top: label_Ax7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay7
                    width:50
                    height:40
                    anchors.top: text_Ax7.bottom
                    anchors.left: label_Ay7.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az7
                    width:20
                    height:40
                    anchors.top: label_Ay7.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az7
                    width:50
                    height:40
                    anchors.top: text_Ay7.bottom
                    anchors.left: label_Az7.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a7
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b7
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle7Img
                width: 425
                height: 260
                anchors.top : rectangle7p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img7;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage7
                    onCallQmlRefeshImg:{
                        img7.source = "";
                        img7.source = "image://CodeImg7";
//                        console.log("set7")
                    }
                }
            }
            Button{
                id: openBtn7
                objectName: "openBtn7"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle7Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn7
                objectName: "closeBtn7"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn7.bottom
                anchors.left:rectangle7Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn7
                    onClicked:{
                        img7.source ="qrc:/camera.png";
                        console.log("reset7")
                    }
                }
            }

            Label {
                id: label_c7
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c7
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m7
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m7
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle7
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition7(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x7.text = Px.toFixed(2)  + " m";
                text_y7.text = Py.toFixed(2)  + " m";
                text_z7.text = Pz.toFixed(2)  + " m";
                text_Vx7.text = Vx.toFixed(2) + " m/s";
                text_Vy7.text = Vy.toFixed(2) + " m/s";
                text_Vz7.text = Vz.toFixed(2) + " m/s";
                text_Ax7.text = Ax.toFixed(2) + " deg";
                text_Ay7.text = Ay.toFixed(2) + " deg";
                text_Az7.text = Az.toFixed(2) + " deg";
            }
            function setState7(connected, armed, mode, battery){
                if(connected === 0) text_c7.text = "FALSE";
                else text_c7.text = "TRUE";
                if(armed === 0) text_a7.text = "FALSE";
                else text_a7.text = "TRUE";
                if(mode === 0)   text_m7.text = "MANUAL";
                else if(mode === 1) text_m7.text = "OFFBOARD";
                else if(mode === 2) text_m7.text = "STABLIZED";
                else if(mode === 4) text_m7.text = "ALTCTL";
                else if(mode === 5) text_m7.text = "POSCTL";
                else text_m7.text = "OTHERS";
                text_b7.text = battery.toFixed(2) + " V";
            }

            }
            Page {
            objectName: "uav8"
            id:uav8
            width:300
            height:400 + 400
            anchors.left: uav7.right
            anchors.leftMargin:  30
            Rectangle{
                id : rectangle8p
                width : 1/6*parent.width
                height: 1/3 * parent.height
                anchors.top : parent.top
                anchors.left: parent.left
                anchors.leftMargin:  20

                Label{
                    id: label_x8
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"X:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_x8
                    width:100
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_x8.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text: " 00.00"
                }
                Label{
                    id: label_y8
                    width:20
                    height:40
                    anchors.top: label_x8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Y:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_y8
                    width:100
                    height:40
                    anchors.top: text_x8.bottom
                    anchors.left: label_y8.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_z8
                    width:20
                    height:40
                    anchors.top: label_y8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Z:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_z8
                    width:50
                    height:40
                    anchors.top: text_y8.bottom
                    anchors.left: label_z8.right
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text: " 00.00"
                }
            }

            Rectangle{
                id:rectangle8v
                width : 1/5*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle8p.right
                anchors.leftMargin: 66
                Label{
                    id:label_Vx8
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 69
                    text:"Vx:"
                    font.bold:  true  //字体加粗margin:20
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vx8
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Vx8.right
                    anchors.leftMargin: 17
                    anchors.topMargin: 70
                    text: " 00.00"
                }
                Label{
                    id:label_Vy8
                    width:20
                    height:40
                    anchors.top: label_Vx8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vy:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vy8
                    width:50
                    height:40
                    anchors.top: text_Vx8.bottom
                    anchors.left: label_Vy8.right
                    anchors.leftMargin: 13
                    anchors.topMargin:  10
                    text: " 00.00"
                }
                Label{
                    id:label_Vz8
                    width:20
                    height:40
                    anchors.top: label_Vy8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"Vz:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Vz8
                    width:200
                    height:40
                    anchors.top: text_Vy8.bottom
                    anchors.left: label_Vz8.right
                    anchors.leftMargin: 13
                    anchors.topMargin: 10
                    text: " 00.00"
                }


                Label {
                    id: labe_a8
                    x: 82
                    y: 238
                    width: 50.125
                    text: qsTr("Armed:")
                    font.bold: true
                    font.pixelSize: 14
                }

                Label {
                    id: label_b8
                    x: 81
                    y: 268
                    width: 116
                    height: 17
                    text: qsTr("Battery:")
                    font.bold: true
                    font.pixelSize: 14
                    z: 1
                }
            }
            Rectangle{
                id : rectangle8a
                width : 1/4*parent.width
                height: parent.height
                anchors.topMargin: 0
                anchors.top : parent.top
                anchors.left: rectangle8v.right
                anchors.leftMargin: 59
                Label{
                    id: label_Ax8
                    width:20
                    height:40
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 70
                    text:"roll:"
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id: text_Ax8
                    width:50
                    height:40
                    anchors.top: parent.top
                    anchors.left: label_Ax8.right
                    anchors.leftMargin: 27
                    anchors.topMargin: 72
                    text: " 00.00"
                }
                Label{
                    id: label_Ay8
                    width:20
                    height:40
                    anchors.top: label_Ax8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"pitch:  "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Ay8
                    width:50
                    height:40
                    anchors.top: text_Ax8.bottom
                    anchors.left: label_Ay8.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }
                Label{
                    id:label_Az8
                    width:20
                    height:40
                    anchors.top: label_Ay8.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    text:"yaw: "
                    font.bold:  true  //字体加粗margin:10
                    font.pixelSize: 14  //字体大小
                }
                Text{
                    id:text_Az8
                    width:50
                    height:40
                    anchors.top: text_Ay8.bottom
                    anchors.left: label_Az8.right
                    anchors.leftMargin: 25
                    anchors.topMargin: 10
                    text: " 00.00"
                }

                Text {
                    id: text_a8
                    x: 36
                    y: 240
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Text {
                    id: text_b8
                    x: 38
                    y: 268
                    width: 39.5
                    height: 15
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }
            }
            Rectangle{
                visible: true
                id : rectangle8Img
                width: 425
                height: 260
                anchors.top : rectangle8p.bottom
                anchors.topMargin:   122
                anchors.left: parent.left
                anchors.leftMargin:  19
                Image{
                    id:img8;
                        width: 400
                        height: 243
                        anchors.verticalCenterOffset: 6
                        anchors.horizontalCenterOffset: 1
                        anchors.centerIn: parent;
                        cache:false;
                        source: "qrc:/camera.png"
                    }
                Connections{
                    target: CodeImage8
                    onCallQmlRefeshImg:{
                        img8.source = "";
                        img8.source = "image://CodeImg8";
                        console.log("set8")
                    }
                }
            }
            Button{
                id: openBtn8
                objectName: "openBtn8"
                text: "ON"
                width:61
                height:31
                anchors.top:parent.top
                anchors.left:rectangle8Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 504
            }
            Button{
                id: closeBtn8
                objectName: "closeBtn8"
                text: "OFF"
                width:61
                height:31
                anchors.top:openBtn8.bottom
                anchors.left:rectangle8Img.right
                anchors.leftMargin: -1
                anchors.topMargin: 10
                Connections{
                    target: closeBtn8
                    onClicked:{
                        img8.source ="qrc:/camera.png"
                        console.log("reset8")
                    }
                }
            }

            Label {
                id: label_c8
                x: 42
                y: 237
                text: qsTr("Connected:")
                font.pixelSize: 14
                font.bold: true
            }

            Text {
                id: text_c8
                x: 159
                y: 237
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label_m8
                x: 43
                y: 268
                text: qsTr("Mode:")
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: text_m8
                x: 161
                y: 267
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle8
                x: 26
                y: 213
                width: 413
                height: 98
                color: "#00000000"
                radius: 5
                border.color: "#150f0f"
            }

            function setPosition8(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
            {
                text_x8.text = Px.toFixed(2)  + " m";
                text_y8.text = Py.toFixed(2)  + " m";
                text_z8.text = Pz.toFixed(2)  + " m";
                text_Vx8.text = Vx.toFixed(2) + " m/s";
                text_Vy8.text = Vy.toFixed(2) + " m/s";
                text_Vz8.text = Vz.toFixed(2) + " m/s";
                text_Ax8.text = Ax.toFixed(2) + " deg";
                text_Ay8.text = Ay.toFixed(2) + " deg";
                text_Az8.text = Az.toFixed(2) + " deg";
            }
            function setState8(connected, armed, mode, battery){
                if(connected === 0) text_c8.text = "FALSE";
                else text_c8.text = "TRUE";
                if(armed === 0) text_a8.text = "FALSE";
                else text_a8.text = "TRUE";
                if(mode === 0)   text_m8.text = "MANUAL";
                else if(mode === 1) text_m8.text = "OFFBOARD";
                else if(mode === 2) text_m8.text = "STABLIZED";
                else if(mode === 4) text_m8.text = "ALTCTL";
                else if(mode === 5) text_m8.text = "POSCTL";
                else text_m8.text = "OTHERS";
                text_b8.text = battery.toFixed(2) + " V";
            }

            }


            Page {
                objectName: "ugv1"
                id:ugv1
                width:300
                height:400 + 400
                anchors.left: uav8.right
                anchors.leftMargin:  20

                Rectangle{
                    id : rectangle9p
                    width : 1/6*parent.width
                    height: 1/3 * parent.height
                    anchors.top : parent.top
                    anchors.left: parent.left
                    anchors.leftMargin:  20

                    Label{
                        id: label_x9
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"X:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_x9
                        width:100
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_x9.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text: " 00.00"
                    }
                    Label{
                        id: label_y9
                        width:20
                        height:40
                        anchors.top: label_x9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Y:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_y9
                        width:100
                        height:40
                        anchors.top: text_x9.bottom
                        anchors.left: label_y9.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_z9
                        width:20
                        height:40
                        anchors.top: label_y9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Z:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_z9
                        width:50
                        height:40
                        anchors.top: text_y9.bottom
                        anchors.left: label_z9.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                }

                Rectangle{
                    id:rectangle9v
                    width : 1/5*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle9p.right
                    anchors.leftMargin: 66
                    Label{
                        id:label_Vx9
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text:"Vx:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vx9
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Vx9.right
                        anchors.leftMargin: 16
                        anchors.topMargin: 70
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vy9
                        width:20
                        height:40
                        anchors.top: label_Vx9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vy:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vy9
                        width:50
                        height:40
                        anchors.top: text_Vx9.bottom
                        anchors.left: label_Vy9.right
                        anchors.leftMargin: 13
                        anchors.topMargin:  10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vz9
                        width:20
                        height:40
                        anchors.top: label_Vy9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vz:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vz9
                        width:100
                        height:40
                        anchors.top: text_Vy9.bottom
                        anchors.left: label_Vz9.right
                        anchors.leftMargin: 13
                        anchors.topMargin: 10
                        text: " 00.00"
                    }


                    Label {
                        id: label_b9
                        x: -86
                        y: 265
                        width: 116
                        height: 17
                        text: qsTr("Battery:")
                        font.bold: true
                        font.pixelSize: 14
                        z: 1
                    }
                }
                Rectangle{
                    id : rectangle9a
                    width : 1/4*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle9v.right
                    anchors.leftMargin: 59
                    Label{
                        id: label_Ax9
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"roll:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Ax9
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Ax9.right
                        anchors.leftMargin: 27
                        anchors.topMargin: 72
                        text: " 00.00"
                    }
                    Label{
                        id: label_Ay9
                        width:20
                        height:40
                        anchors.top: label_Ax9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"pitch:  "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Ay9
                        width:50
                        height:40
                        anchors.top: text_Ax9.bottom
                        anchors.left: label_Ay9.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Az9
                        width:20
                        height:40
                        anchors.top: label_Ay9.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"yaw: "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Az9
                        width:50
                        height:40
                        anchors.top: text_Ay9.bottom
                        anchors.left: label_Az9.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }

                    Text {
                        id: text_b9
                        x: -123
                        y: 266
                        width: 39.5
                        height: 15
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }
                }
                Rectangle{
                    visible: true
                    id : rectangle9Img
                    width: 425
                    height: 260
                    anchors.top : rectangle9p.bottom
                    anchors.topMargin:   122
                    anchors.left: parent.left
                    anchors.leftMargin:  19
                    Image{
                        id:img9;
                            width: 400
                            height: 243
                            anchors.verticalCenterOffset: 1
                            anchors.horizontalCenterOffset: 1
                            anchors.centerIn: parent;
                            cache:false;
                            source: "qrc:/camera.png"
                        }
                    Connections{
                        target: CodeImage9
                        onCallQmlRefeshImg:{
                            img9.source = "";
                            img9.source = "image://CodeImg9";
//                            console.log("set9")
                        }
                    }
                }
                Button{
                    id: openBtn9
                    objectName: "openBtn9"
                    text: "ON"
                    width:61
                    height:31
                    anchors.top:parent.top
                    anchors.left:rectangle9Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 504
                }
                Button{
                    id: closeBtn9
                    objectName: "closeBtn9"
                    text: "OFF"
                    width:61
                    height:31
                    anchors.top:openBtn9.bottom
                    anchors.left:rectangle9Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 10
                    Connections{
                        target: closeBtn9
                        onClicked:{
                            img9.source ="qrc:/camera.png"
                            console.log("reset9")
                        }
                    }
                }

                Label {
                    id: label_c9
                    x: 83
                    y: 237
                    text: qsTr("Connected:")
                    font.pixelSize: 14
                    font.bold: true
                }

                Text {
                    id: text_c9
                    x: 209
                    y: 237
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Rectangle {
                    id: rectangle_9
                    x: 26
                    y: 213
                    width: 413
                    height: 98
                    color: "#00000000"
                    radius: 5
                    border.color: "#150f0f"
                }

                function setPosition1(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
                {
                    text_x9.text = Px.toFixed(2)  + " m";
                    text_y9.text = Py.toFixed(2)  + " m";
                    text_z9.text = Pz.toFixed(2)  + " m";
                    text_Vx9.text = Vx.toFixed(2) + " m/s";
                    text_Vy9.text = Vy.toFixed(2) + " m/s";
                    text_Vz9.text = Vz.toFixed(2) + " m/s";
                    text_Ax9.text = Ax.toFixed(2) + " deg";
                    text_Ay9.text = Ay.toFixed(2) + " deg";
                    text_Az9.text = Az.toFixed(2) + " deg";
                }
                function setState1(connected,battery){
                    if(connected === 0) text_c9.text = "FALSE";
                    else text_c9.text = "TRUE";

                    text_b9.text = battery.toFixed(2) + " V";
                }

            }


            Page {
                objectName: "ugv2"
                id:ugv2
                width:300
                height:400 + 400
                anchors.left: ugv1.right
                anchors.leftMargin:  20

                Rectangle{
                    id : rectangle10p
                    width : 1/6*parent.width
                    height: 1/3 * parent.height
                    anchors.top : parent.top
                    anchors.left: parent.left
                    anchors.leftMargin:  20

                    Label{
                        id: label_x10
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"X:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_x10
                        width:100
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_x10.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text: " 00.00"
                    }
                    Label{
                        id: label_y10
                        width:20
                        height:40
                        anchors.top: label_x10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Y:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_y10
                        width:100
                        height:40
                        anchors.top: text_x10.bottom
                        anchors.left: label_y10.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_z10
                        width:20
                        height:40
                        anchors.top: label_y10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Z:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_z10
                        width:50
                        height:40
                        anchors.top: text_y10.bottom
                        anchors.left: label_z10.right
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                }

                Rectangle{
                    id:rectangle10v
                    width : 1/5*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle10p.right
                    anchors.leftMargin: 66
                    Label{
                        id:label_Vx10
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 69
                        text:"Vx:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vx10
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Vx10.right
                        anchors.leftMargin: 16
                        anchors.topMargin: 70
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vy10
                        width:20
                        height:40
                        anchors.top: label_Vx10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vy:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vy10
                        width:50
                        height:40
                        anchors.top: text_Vx10.bottom
                        anchors.left: label_Vy10.right
                        anchors.leftMargin: 13
                        anchors.topMargin:  10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Vz10
                        width:20
                        height:40
                        anchors.top: label_Vy10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"Vz:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Vz10
                        width:100
                        height:40
                        anchors.top: text_Vy10.bottom
                        anchors.left: label_Vz10.right
                        anchors.leftMargin: 13
                        anchors.topMargin: 10
                        text: " 00.00"
                    }


                    Label {
                        id: label_b10
                        x: -86
                        y: 265
                        width: 116
                        height: 17
                        text: qsTr("Battery:")
                        font.bold: true
                        font.pixelSize: 14
                        z: 1
                    }
                }
                Rectangle{
                    id : rectangle10a
                    width : 1/4*parent.width
                    height: parent.height
                    anchors.topMargin: 0
                    anchors.top : parent.top
                    anchors.left: rectangle10v.right
                    anchors.leftMargin: 59
                    Label{
                        id: label_Ax10
                        width:20
                        height:40
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 70
                        text:"roll:"
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id: text_Ax10
                        width:50
                        height:40
                        anchors.top: parent.top
                        anchors.left: label_Ax10.right
                        anchors.leftMargin: 27
                        anchors.topMargin: 72
                        text: " 00.00"
                    }
                    Label{
                        id: label_Ay10
                        width:20
                        height:40
                        anchors.top: label_Ax10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"pitch:  "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Ay10
                        width:50
                        height:40
                        anchors.top: text_Ax10.bottom
                        anchors.left: label_Ay10.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }
                    Label{
                        id:label_Az10
                        width:20
                        height:40
                        anchors.top: label_Ay10.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.topMargin: 10
                        text:"yaw: "
                        font.bold:  true  //字体加粗margin:10
                        font.pixelSize: 14  //字体大小
                    }
                    Text{
                        id:text_Az10
                        width:50
                        height:40
                        anchors.top: text_Ay10.bottom
                        anchors.left: label_Az10.right
                        anchors.leftMargin: 25
                        anchors.topMargin: 10
                        text: " 00.00"
                    }

                    Text {
                        id: text_b10
                        x: -123
                        y: 266
                        width: 39.5
                        height: 15
                        text: qsTr(" 00.00")
                        font.pointSize: 11
                    }
                }
                Rectangle{
                    visible: true
                    id : rectangle10Img
                    width: 425
                    height: 260
                    anchors.top : rectangle10p.bottom
                    anchors.topMargin:   122
                    anchors.left: parent.left
                    anchors.leftMargin:  19
                    Image{
                        id:img10;
                            width: 400
                            height: 243
                            anchors.verticalCenterOffset: 1
                            anchors.horizontalCenterOffset: 1
                            anchors.centerIn: parent;
                            cache:false;
                            source: "qrc:/camera.png"
                        }
                    Connections{
                        target: CodeImage10
                        onCallQmlRefeshImg:{
                            img10.source = "";
                            img10.source = "image://CodeImg10";
                        }
                    }
                }
                Button{
                    id: openBtn10
                    objectName: "openBtn10"
                    text: "ON"
                    width:61
                    height:31
                    anchors.top:parent.top
                    anchors.left:rectangle10Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 504
                }
                Button{
                    id: closeBtn10
                    objectName: "closeBtn10"
                    text: "OFF"
                    width:61
                    height:31
                    anchors.top:openBtn10.bottom
                    anchors.left:rectangle10Img.right
                    anchors.leftMargin: -1
                    anchors.topMargin: 10
                    Connections{
                        target: closeBtn10
                        onClicked:{
                            img10.source ="qrc:/camera.png"
                        }
                    }
                }

                Label {
                    id: label_c10
                    x: 83
                    y: 237
                    text: qsTr("Connected:")
                    font.pixelSize: 14
                    font.bold: true
                }

                Text {
                    id: text_c10
                    x: 209
                    y: 237
                    text: qsTr(" 00.00")
                    font.pointSize: 11
                }

                Rectangle {
                    id: rectangle_10
                    x: 26
                    y: 213
                    width: 413
                    height: 98
                    color: "#00000000"
                    radius: 5
                    border.color: "#150f0f"
                }

                function setPosition2(Px,Py,Pz,Vx,Vy,Vz,Ax,Ay,Az)
                {
                    text_x10.text = Px.toFixed(2)  + " m";
                    text_y10.text = Py.toFixed(2)  + " m";
                    text_z10.text = Pz.toFixed(2)  + " m";

                    text_Vx10.text = Vx.toFixed(2) + " m/s";
                    text_Vy10.text = Vy.toFixed(2) + " m/s";
                    text_Vz10.text = Vz.toFixed(2) + " m/s";

                    text_Ax10.text = Ax.toFixed(2) + " deg";
                    text_Ay10.text = Ay.toFixed(2) + " deg";
                    text_Az10.text = Az.toFixed(2) + " deg";
                }
                function setState2(connected,battery){
                    if(connected === 0) text_c10.text = "FALSE";
                    else text_c10.text = "TRUE";

                    text_b10.text = battery.toFixed(2) + " V";
                }
            }

        } //SwipeView

        TabBar {
            id: tabBar
            currentIndex: view.currentIndex
            anchors.leftMargin:  5

            TabButton {
                text: qsTr("UAV1")        
                ColorAnimation {
                    from: "white"
                    to: "black"
                    duration: 200
                }
            }
            TabButton {
                text: qsTr("UAV2")
            }
            TabButton {
                text: qsTr("UAV3")
            }
            TabButton {
                text: qsTr("UAV4")
            }
            TabButton {
                text: qsTr("UAV5")
            }
            TabButton {
                text: qsTr("UAV6")
            }
            TabButton {
                text: qsTr("UAV7")
            }
            TabButton {
                text: qsTr("UAV8")
            }
            TabButton {
                text: qsTr("UGV1")
            }
            TabButton {
                text: qsTr("UGV2")
            }
        }
    }

    //集群位置信息
    GroupBox{
        id:groupbox_position
        title: "位置集群信息"
        width:2/5*parent.width + 60 //2/5
        height:4/6*parent.height + 80
        font.wordSpacing: 0
        font.weight: Font.Normal
        font.capitalization: Font.MixedCase
        font.strikeout: false  //5/6
        anchors.top:parent.top
        anchors.left:groupbox_attitude.right
        anchors.margins: 10

        ChartView {
            anchors.rightMargin: -12
            anchors.bottomMargin: -12
            anchors.leftMargin: -12
            anchors.topMargin: -10
            objectName: "chartView"
            anchors.fill:parent
            theme: ChartView.ChartThemeBrownSand
            antialiasing: true
            animationOptions:ChartView.SeriesAnimations

            ValueAxis{
                id:xAxis
                min:-10.00
                tickCount:21  //网格线数目
                max:10.00
            }
            ValueAxis{
                id:yAxis
                min:-10.00
                max:10.00
                tickCount:21  //网格
            }
            ScatterSeries{color:"#80FF7F24"; borderColor:"#80FF7F24"; borderWidth:1;axisX:xAxis;axisY:yAxis;id:s1;name:"UAV1";XYPoint{id:u1;x:-9;y:9.5;}}
            ScatterSeries{color:"#80000000"; borderColor:"#80000000"; borderWidth:1;axisX:xAxis;axisY:yAxis;id:s2;name:"UAV2";XYPoint{id:u2;x:-7;y:9.5;}}
            ScatterSeries{color:"#809900cc"; borderColor:"#809900cc"; borderWidth:1;axisX:xAxis;axisY:yAxis;id:s3;name:"UAV3";XYPoint{id:u3;x:-5;y:9.5;}}
            ScatterSeries{color:"#800000FF"; borderColor:"#800000FF"; borderWidth:5;axisX:xAxis;axisY:yAxis;id:s4;name:"UAV4";XYPoint{id:u4;x:-3;y:9.5;}}
            ScatterSeries{color:"#80FF0000"; borderColor:"#80FF0000"; borderWidth:5;axisX:xAxis;axisY:yAxis;id:s5;name:"UAV5";XYPoint{id:u5;x:-1;y:9.5;}}
            ScatterSeries{color:"#80ffffff"; borderColor:"#80ffffff"; borderWidth:5;axisX:xAxis;axisY:yAxis;id:s6;name:"UAV6";XYPoint{id:u6;x:1;y:9.5;}}
            ScatterSeries{color:"#80006633"; borderColor:"#80006633"; borderWidth:5;axisX:xAxis;axisY:yAxis;id:s7;name:"UAV7";XYPoint{id:u7;x:3;y:9.5;}}
            ScatterSeries{color:"#8000E5EE"; borderColor:"#8000E5EE"; borderWidth:5;axisX:xAxis;axisY:yAxis;id:s8;name:"UAV8";XYPoint{id:u8;x:5;y:9.5;}}
            ScatterSeries{color:"#000000"; borderColor:"#80006633"; borderWidth:15;axisX:xAxis;axisY:yAxis;id:s9;name:"UGV1";XYPoint{id:u9;x:7;y:9.5;}}
            ScatterSeries{color:"#000000"; borderColor:"#80FF0000"; borderWidth:15;axisX:xAxis;axisY:yAxis;id:s10;name:"UGV2";XYPoint{id:u10;x:9;y:9.5;}}
            function setPositionC1(_1x,_1y,_2x,_2y,_3x,_3y,_4x,_4y)
            {
                s1.clear();s2.clear();s3.clear();s4.clear();
                s1.append(-_1y,_1x)
                s2.append(-_2y,_2x)
                s3.append(-_3y,_3x)
                s4.append(-_4y,_4x)
            }
            function setPositionC2(_5x,_5y,_6x,_6y,_7x,_7y,_8x,_8y)
            {
                s5.clear();s6.clear();s7.clear();s8.clear();
                s5.append(-_5y,_5x)
                s6.append(-_6y,_6x)
                s7.append(-_7y,_7x)
                s8.append(-_8y,_8x)
            }
            function setPositionC3(_1x,_1y,_2x,_2y)
            {
                s9.clear();s10.clear(0);
                s9.append(-_1y,_1x)
                s10.append(-_2y,_2x)
            }
         }
    }

    //控制指令
    GroupBox{
        id:groupbox_Command
        title: "控制指令"
        width:1/4*parent.width
        height:2/3*parent.height
        z: 1
        anchors.leftMargin: 11
        anchors.topMargin: 14
        anchors.top: parent.top
        anchors.left:groupbox_position.right
        anchors.margins: 2
            Button{
                id: sendMesBtn
                objectName: "BtnS"
                text: "      发送控制指令"
                font.pointSize: 18
                font.family: "Tahoma"
                anchors.leftMargin: 60
                anchors.topMargin: 34
                width:300
                height:60
                anchors.top:parent.top
                anchors.left:parent.left
                anchors.margins: 20
                Image{
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 13
                    anchors.leftMargin: 36
                    width: 1/5*parent.width
                    height:3/5*parent.height
                    source:"qrc:/Pic/Send message.png"
                }
            }
            Button{
                id:but1
                x: 30
                y: 200
                objectName: "DownBtn"
                width: 5/6 *parent.width
                height: 60
                anchors.left:parent.left
                anchors.top:sendMesBtn.bottom
                anchors.topMargin: 88
                anchors.leftMargin: 20
                text:"  降落"
                font.pointSize: 20
                font.bold: false
                Image{
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 12
                    anchors.leftMargin: 13
                    width: 1/8*parent.width
                    height:3/5*parent.height
                    source:"qrc:/Pic/down.png"
                }

            }

            Button{
                id:but2
                objectName: "UpBtn"
                width: 5/6 * parent.width
                height: 60
                anchors.left: parent.left
                anchors.top:but1.bottom
                anchors.topMargin: 15
                anchors.leftMargin: 20
                text:"  起飞"
                font.bold: false
                font.pointSize: 20
                Image{
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 12
                    anchors.leftMargin: 14
                    width: 1/8*parent.width
                    height: 36
                    source:"qrc:/Pic/up.png"
                }
            }

            Button{
                id: but3
                objectName: "HoverBtn"
                width: 5/6 *parent.width
                height: 60
                anchors.left: parent.left
                anchors.top:but2.bottom
                anchors.topMargin: 13
                anchors.leftMargin: 20
                text:" 悬停"
                wheelEnabled: true
                font.bold: false
                font.pointSize: 20
                Image{
                    anchors.left:parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 4
                    anchors.leftMargin: 9
                    width: 1/8*parent.width
                    height:3/5*parent.height
                }
            }


        GroupBox{
            id:groupbox_formation
            y: 402
            anchors.top:but3.bottom
            anchors.left:parent.left
            anchors.topMargin: 20
            anchors.leftMargin: 20
            width:6/7*parent.width
            height:1/3*parent.height

//                ColumnLayout
            ButtonGroup{
                objectName: "BtnG"
                buttons: column.children
            }
            ColumnLayout{
                id:column
                width: 140
                height: 181
                RadioButton{
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin:  20
                    anchors.topMargin:  20
                    objectName:"triangle"
                    id:rb1
                    text:"三角编队"
                }
                RadioButton{
                    anchors.left: rb1.right
                    anchors.top: parent.top
                    anchors.leftMargin:  20
                    anchors.topMargin:  20
                    objectName:"rectangle"
                    id:rb2
                    text:"圆形编队"
                }
                RadioButton{
                    anchors.left: parent.left
                    anchors.top: rb1.bottom
                    anchors.leftMargin:  20
                    anchors.topMargin:  20
                    objectName:"circular"
                    id:rb3
                    text:"矩形编队"
                }
                RadioButton{
                    anchors.left: rb3.right
                    anchors.top: rb2.bottom
                    anchors.leftMargin:  20
                    anchors.topMargin:  20
                    objectName:"column"
                    id:rb4
                    text:"一字编队"
                }
                Button{
                    objectName: "btn3"
                    id: but
                    width: 140
                    height: 50
                    anchors.left:parent.left
                    anchors.top:rb3.bottom
                    anchors.topMargin: 10
                    anchors.leftMargin: 100
                    text:"确认"
                    font.weight: Font.Black
                    font.bold: true
                    font.pointSize: 14
                    //                    checked:checkable
                }
            }
        }

        Rectangle {
            id: rectangle1
            x: -12
            y: 112
            width: 450
            height: 524
            color: "#c1c2c2"
            z: -1
        }

        Label {
            id: label5
            x: 9
            y: 135
            text: qsTr("Case 1")
            font.pointSize: 20
        }
    }

    Rectangle{
        id : detection
        width: 1323
        height: 230
        color: "#d7d4d4"
        border.color: "#00000000"
        anchors.leftMargin: 8
        anchors.top:groupbox_position.bottom
        anchors.left:parent.left
        anchors.topMargin: 7

        Label{
            id: case2
            x: 17
            y: 18
            width: 81
            height: 21
            text:"Case 2"
            font.pixelSize: 20
            font.bold:  true  //字体加粗margin:10
            //字体大小
        }

        Button{
            id: startBtn1
            objectName: "startBtn1"
            width:129
            height:60
            text: qsTr("启动")
            anchors.leftMargin: 25
            anchors.topMargin: 116
            font.pointSize: 14
            font.weight: Font.Black
            font.capitalization: Font.MixedCase
            font.italic: false
            font.bold: true
            hoverEnabled: true
            autoRepeat: false
            autoExclusive: false
            checked: false
            checkable: false
            wheelEnabled: false
            anchors.top: parent.top
            anchors.left:parent.left
            anchors.margins: 20
        }
        Button{
            id: returnBtn1
            objectName: "returnBtn1"
            text: "返回"
            font.weight: Font.Black
            font.bold: true
            font.pointSize: 14
            anchors.leftMargin: 33
            anchors.topMargin: 116
            width: 124
            height:60
            anchors.top: parent.top
            anchors.left:startBtn1.right
            anchors.margins: 20
        }
        Button{
            id: stopBtn1
            objectName: "stopBtn1"
            text: "停止"
            font.bold: true
            font.weight: Font.Black
            font.pointSize: 14
            anchors.leftMargin: 33
            anchors.topMargin: 116
            width:128
            height:60
            anchors.top: parent.top
            anchors.left:returnBtn1.right
            anchors.margins: 20
        }


        Rectangle{
            id : target1
            objectName:  "target1"
            x: 420
            width: 375
            height: 230
            anchors.top: case2.bottom
            anchors.left: parent.left
            anchors.margins:  5
            color: "#ea5b5b"
            anchors.leftMargin: 543
            anchors.rightMargin: 48
            anchors.topMargin: -39
            border.color: "#00000000"

            Label{
                id: label_target1
                x: 24
                width: 71
                height: 32
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins:  5
                text:"目标 1"
                anchors.leftMargin: 123
                anchors.rightMargin: 249
                anchors.topMargin: 2
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 20  //字体大小
            }
            Label{
                id: label_n1
                x: 82
                y: 38
                text:"目标名字:"
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 15  //字体大小
            }
            Text{
                id: text_n1
                x: 162
                y: 41
                width:100
                height:29
                text: " 00.00"
            }

            Label{
                id: label_tx1
                x: 47
                y: 104
                text:"x: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_tx1
                x: 71
                y: 107
                width:49
                height:25
                text: " 00.00"
            }
            Label{
                id: label_ty1
                x: 140
                y: 105
                text:"y: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_ty1
                x: 162
                y: 108
                width:70
                height:26
                text: " 00.00"
            }
            Label{
                id: label_tz1
                x: 235
                y: 106
                text:"z: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_tz1
                x: 261
                y: 108
                width:70
                height:26
                text: " 00.00"
            }

            Label {
                id: label3
                x: 79
                y: 78
                width: 68
                height: 27
                text: qsTr("无人机ID:")
                font.pixelSize: 15
                font.bold: true
            }

            Text {
                id: text_id1
                x: 162
                y: 83
                width: 74
                height: 20
                text: qsTr(" 00.00")
                font.family: "ubuntu"
                font.pointSize: 11
            }

            Label {
                id: label6
                x: 84
                y: 156
                text: qsTr("无人车ID:")
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: text_id11
                x: 164
                y: 161
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label7
                x: 46
                y: 181
                text: qsTr("x:")
                font.pixelSize: 17
                font.bold: true
            }

            Text {
                id: text_tx11
                x: 73
                y: 184
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label8
                x: 136
                y: 183
                text: qsTr("y:")
                font.bold: true
                font.pixelSize: 17
            }

            Text {
                id: text_tx12
                x: 164
                y: 184
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label9
                x: 234
                y: 183
                text: qsTr("z:")
                font.bold: true
                font.pixelSize: 17
            }

            Text {
                id: text_tx13
                x: 259
                y: 186
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle9
                x: 13
                y: 75
                width: 345
                height: 59
                color: "#00000000"
                radius: 5
                border.color: "#2e2e2e"
            }

            Rectangle {
                id: rectangle10
                x: 13
                y: 151
                width: 345
                height: 58
                color: "#00000000"
                radius: 5
                border.color: "#2f2c2c"
            }
            function setDetection1(uavID, objectName, x, y, z){
                text_id1.text = uavID
                if(objectName === 1) text_n1.text = "TANK";
                else if(objectName === 2) text_n1.text = "UAV";
                else if(objectName === 3) text_n1.text = "UGV";
                else text_n1.text = "UNKNOWN";
                text_tx1.text = x.toFixed(2)
                text_ty1.text = y.toFixed(2)
                text_tz1.text = z.toFixed(2)
            }
            function setDetectionUGV1(ugvID, objectName, x, y, z){
                text_id11.text = ugvID-8
                if(objectName === 1) text_n1.text = "TANK";
                else if(objectName === 2) text_n1.text = "UAV";
                else if(objectName === 3) text_n1.text = "UGV";
                else text_n1.text = "UNKNOWN";

                text_tx11.text = x.toFixed(2)
                text_tx12.text = y.toFixed(2)
                text_tx13.text = z.toFixed(2)
            }
        }

        Rectangle{
            id : target2
            objectName: "target2"
            x: 940
            width: 383
            height: 230
            anchors.top: case2.bottom
            anchors.right: parent.right
            anchors.margins: 5
            color: "#729fcf"
            anchors.rightMargin: 0
            border.color: "#00000000"
            anchors.leftMargin: 20
            anchors.topMargin: -39

            Label{
                id: label_target2
                x: 24
                width: 74
                height: 33
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins:  5
                text:"目标 2"
                anchors.leftMargin: 123
                anchors.rightMargin: 249
                anchors.topMargin: 3
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 20  //字体大小
            }
            Label{
                id: label_n2
                x: 87
                y: 39
                text:"目标名字:"
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 15  //字体大小
            }
            Text{
                id: text_n2
                x: 172
                y: 43
                width:100
                height:29
                text: " 00.00"
            }

            Label{
                id: label_tx2
                x: 49
                y: 106
                text:"x: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_tx2
                x: 73
                y: 109
                width:49
                height:17
                text: " 00.00"
            }
            Label{
                id: label_ty2
                x: 142
                y: 105
                text:"y: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_ty2
                x: 164
                y: 108
                width:70
                height:18
                text: " 00.00"
            }
            Label{
                id: label_tz2
                x: 237
                y: 106
                text:"z: "
                anchors.rightMargin: 249
                anchors.topMargin: 14
                font.bold:  true  //字体加粗margin:10
                font.pixelSize: 17  //字体大小
            }
            Text{
                id: text_tz2
                x: 263
                y: 108
                width:70
                height:17
                text: " 00.00"
            }

            Label {
                id: label4
                x: 88
                y: 80
                text: qsTr("无人机ID:")
                font.pixelSize: 15
                font.bold: true
            }

            Text {
                id: text_id2
                x: 174
                y: 83
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle11
                x: 19
                y: 75
                width: 341
                height: 60
                color: "#00000000"
                radius: 5
                border.color: "#000000"
            }

            Label {
                id: label10
                x: 88
                y: 158
                text: qsTr("无人车ID:")
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: text_id22
                x: 174
                y: 162
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label11
                x: 48
                y: 182
                text: qsTr("x:")
                font.bold: true
                font.pixelSize: 17
            }

            Text {
                id: text_tx21
                x: 74
                y: 185
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label12
                x: 141
                y: 183
                text: qsTr("y:")
                font.bold: true
                font.pixelSize: 17
            }

            Text {
                id: text_tx22
                x: 164
                y: 185
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Label {
                id: label13
                x: 235
                y: 184
                text: qsTr("z:")
                font.bold: true
                font.pixelSize: 17
            }

            Text {
                id: text_tx23
                x: 260
                y: 186
                text: qsTr(" 00.00")
                font.pointSize: 11
            }

            Rectangle {
                id: rectangle12
                x: 19
                y: 153
                width: 341
                height: 58
                color: "#00000000"
                radius: 5
                border.color: "#332d2d"
            }

            function setDetection2(uavID, objectName, x, y, z){
                text_id2.text = uavID

                if(objectName === 1) text_n2.text = "TANK";
                else if(objectName === 2) text_n2.text = "UAV";
                else if(objectName === 3) text_n2.text = "UGV";
                else text_n2.text = "UNKNOWN";

                text_tx2.text = x.toFixed(2)
                text_ty2.text = y.toFixed(2)
                text_tz2.text = z.toFixed(2)
            }

            function setDetectionUGV2(ugvID, objectName, x, y, z){
                text_id22.text = ugvID-8
                if(objectName === 1) text_n2.text = "TANK";
                else if(objectName === 2) text_n2.text = "UAV";
                else if(objectName === 3) text_n2.text = "UGV";
                else text_n2.text = "UNKNOWN";

                text_tx21.text = x.toFixed(2)
                text_tx22.text = y.toFixed(2)
                text_tx23.text = z.toFixed(2)
            }
        }
   }

    Rectangle{
        id : score
        objectName: "score"
        width: 450
        height: 299
        color: "#ffffff"
        border.color: "#00000000"
        anchors.top: groupbox_Command.bottom
        anchors.left: detection.right
        anchors.topMargin: 16
        anchors.leftMargin: 11

        Label{
            id: case3
            x: 8
            y: 8
            text:"Case 3"
            font.pixelSize: 20
            font.bold:  true  //字体加粗margin:10
            //字体大小
        }
        Image{
            id: imgRed
            width: 71
            height: 34
            clip: true
                anchors.topMargin: 5
                anchors.verticalCenterOffset: -68
                anchors.horizontalCenterOffset: -128
                anchors.centerIn: parent;
                cache:false;
                source: "qrc:/png/red.png"
         }
        Image{
            id: imgBlue
            width: 68
            height: 33
            clip: true
                anchors.topMargin: 5
                anchors.verticalCenterOffset: -67
                anchors.horizontalCenterOffset: 96
                anchors.centerIn: parent;
                cache:false;
                source: "qrc:/png/blue.png"
        }

         Text {
             id: text_red
             x: 74
             y: 98
             width: 102
             height: 82
             text: qsTr("0")
             font.family: "Tahoma"
             font.bold: true
             font.pixelSize: 50
         }

         Text {
             id: text_blue
             x: 298
             y: 98
             width: 104
             height: 92
             text: qsTr("0")
             font.family: "Tahoma"
             font.bold: true
             font.pixelSize: 50
         }

         Text {
             id: element2
             x: 211
             y: 98
             width: 38
             height: 57
             text: qsTr(":")
             font.bold: true
             font.pixelSize: 50
         }

         Button{
             id: startBtn
             x: 3
             objectName: "startBtn"
             width:129
             height:60
             text: qsTr("启动")
             anchors.leftMargin: 10
             anchors.topMargin: 21
             font.pointSize: 14
             font.weight: Font.Black
             font.capitalization: Font.MixedCase
             font.italic: false
             font.bold: true
             hoverEnabled: true
             autoRepeat: false
             autoExclusive: false
             checked: false
             checkable: false
             wheelEnabled: false
             anchors.top:text_red.bottom
             anchors.left:groupbox_position.right
             anchors.margins: 20
         }
         Button{
             id: returnBtn
             objectName: "returnBtn"
             text: "返回"
             font.weight: Font.Black
             font.bold: true
             font.pointSize: 14
             anchors.leftMargin: 33
             anchors.topMargin: 20
             width: 124
             height:60
             anchors.top:text_red.bottom
             anchors.left:startBtn.right
             anchors.margins: 20
         }
         Button{
             id: stopBtn
             objectName: "stopBtn"
             text: "停止"
             font.bold: true
             font.weight: Font.Black
             font.pointSize: 14
             anchors.leftMargin: 33
             anchors.topMargin: 21
             width:128
             height:60
             anchors.top:text_red.bottom
             anchors.left:returnBtn.right
             anchors.margins: 20
         }
         function setScores(scoreRed, scoreBlue){
             text_red.text = scoreRed;
             text_blue.text = scoreBlue;
         }
    }



}
































































/*##^## Designer {
    D{i:2;invisible:true}D{i:1;invisible:true}D{i:5;invisible:true}D{i:69;invisible:true}
D{i:70;invisible:true}D{i:68;invisible:true}D{i:73;invisible:true}D{i:72;invisible:true}
D{i:74;invisible:true}D{i:76;invisible:true}D{i:77;invisible:true}D{i:78;invisible:true}
D{i:94;invisible:true}D{i:95;invisible:true}D{i:97;invisible:true}D{i:98;invisible:true}
D{i:99;invisible:true}D{i:100;invisible:true}D{i:101;invisible:true}D{i:102;invisible:true}
D{i:103;invisible:true}D{i:104;invisible:true}D{i:96;invisible:true}D{i:106;invisible:true}
D{i:107;invisible:true}D{i:105;invisible:true}D{i:108;invisible:true}D{i:110;invisible:true}
D{i:109;invisible:true}D{i:111;invisible:true}D{i:112;invisible:true}D{i:113;invisible:true}
D{i:114;invisible:true}D{i:115;invisible:true}D{i:273;invisible:true}D{i:274;invisible:true}
D{i:275;invisible:true}D{i:277;invisible:true}D{i:278;invisible:true}D{i:279;invisible:true}
D{i:282;invisible:true}D{i:283;invisible:true}D{i:281;invisible:true}D{i:297;invisible:true}
D{i:298;invisible:true}D{i:299;invisible:true}D{i:303;invisible:true}D{i:305;invisible:true}
D{i:306;invisible:true}D{i:307;invisible:true}D{i:302;invisible:true}D{i:321;invisible:true}
D{i:322;invisible:true}D{i:323;invisible:true}D{i:324;invisible:true}D{i:326;invisible:true}
D{i:327;invisible:true}D{i:325;invisible:true}D{i:328;invisible:true}D{i:329;invisible:true}
D{i:330;invisible:true}D{i:301;invisible:true}D{i:333;invisible:true}D{i:334;invisible:true}
D{i:335;invisible:true}D{i:332;invisible:true}D{i:331;invisible:true}D{i:4;invisible:true}
D{i:371;invisible:true}D{i:373;invisible:true}D{i:372;invisible:true}
}
 ##^##*/
