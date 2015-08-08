import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../bootstrap/buttons"
import "../bootstrap/variables/fontawesome.js" as FontAwesome

Rectangle {
    id :rSalir
    width: parent.width
    height:parent.height

    //imagen de fondo para el menu salir
    Image {
        id: rSalirImagen
        width: parent.width
        height:parent.height
        source: Direccion+ "/Historia/menu2.jpg"
    }


    Rectangle{
        id:rSalirContendor
        width: parent.width/2
        height: parent.height/4
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color:"#e29528"
        Text {
            id: rSalirTxtPregunta
            text: "Desea salir del juego?"
            width: parent.width
            height: 10
            //verticalAlignment: Text.AlignTop
            //wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }


        ButtonDefault{
            id:rSalirSi
            class_name: "balanced"
            anchors.horizontalCenter: rSalirContendor.horizontalCenter

            anchors.top: rSalirTxtPregunta.bottom
            anchors.topMargin: 20

            width: 60

            text:"Si"

            MouseArea{
                anchors.fill: parent
                onClicked: {Qt.quit()}
            }
        }

        ButtonDefault{
            id:rSalirNo
            class_name: "balanced"

            anchors.top: rSalirTxtPregunta.bottom
            anchors.topMargin: 20

            anchors.left: rSalirSi.right
            anchors.leftMargin: 15


            width:60

            //radius: 10
            //color: "green"
            text:"No"
            /*Text {
                id: rSalirTxtNo
                anchors.horizontalCenter: rSalirNo.horizontalCenter
                text: qsTr("no")
                font.pixelSize: 18
            }*/
            MouseArea{
                anchors.fill: parent
                onClicked: {rSalir.visible=false}
            }

        }


    }


}
