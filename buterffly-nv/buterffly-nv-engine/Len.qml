import QtQuick 2.5

Rectangle {

    id :recs
    visible: true
    width: parent.width
    height:parent.height

    property bool isvisible: true
    //imagen de fondo para el menu
    Image {
        width: parent.width
        height:parent.height
        id: name
        source: Direccion+ "/Historia/club.jpg"
    }

    //opciones del menu
    //iniciar juego
    Rectangle{
        id:iniciar
        width: 100
        height: 30

        x : parent.width/2 - 50
        y: parent.height /2
        color:"blue"
        Text {
            id: inicio
            text: qsTr("Iniciar juego")
        }

        MouseArea {
            anchors.fill: parent
            onClicked: { recs.visible=false; isvisible=false }
        }
		
    }
    //cargar juego
    Rectangle{
        id:cargar
        width: 100
        height: 30

        x : parent.width/2 - 50
        y: parent.height /2 + 40
        color:"green"
        Text {
            id: txtcargar
            text: qsTr("Cargar juego")
        }
    }
    //preferencias
    Rectangle{
        id:preferencias
        width: 100
        height: 30

        x : parent.width/2 - 50
        y: parent.height /2 + 80
        color:"blue"
        Text {
            id: txtpreferencias
            text: qsTr("Preferencias")
        }

    }
    //ayuda
    Rectangle{
        id:ayuda
        width: 100
        height: 30

        x : parent.width/2 - 50
        y: parent.height /2 + 120
        color:"blue"
        Text {
            id: txtayuda
            text: qsTr("Ayuda")
        }
    }
    //salir
    Rectangle{
        width: 100
        height: 30
        x : parent.width /2 - 50
        y: parent.height /2 + 160
        color:"red"
        Text {
            id: salir
            text: qsTr("Salir")
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {Qt.quit()}
        }
    }
}
