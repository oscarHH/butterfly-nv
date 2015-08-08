import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../bootstrap/buttons"
import "../bootstrap/variables/fontawesome.js" as FontAwesome

Rectangle {
    id :recs
    width: parent.width
    height:parent.height

    //imagen de fondo para el menu
    Image {
        width: parent.width
        height:parent.height
        id: name
        source: Direccion+ "/Historia/menu.jpg"
    }





    //opciones del menu
    //iniciar juego
    /*Rectangle{
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
            onClicked: { recs.visible=false; rect.visible =true; runJS()}

        }
		
    }*/
    //cargar juego
    /*Rectangle{
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
    }*/


    RowLayout{
        //Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        //Layout.preferredWidth: parent.width - 20
        anchors.fill: parent

    Column {
        spacing: 10
        Layout.alignment: Qt.AlignBottom | Qt.AlignRight

        ButtonDefault {
            id:iniciar
            class_name: "balanced"
            text: "Iniciar Juego"
            MouseArea {
                anchors.fill: parent
                onClicked: { recs.visible=false; rect.visible =true; runJS()}

            }
        }

        ButtonDefault {
            id:cargaJuego
            class_name: "balanced"
            text: "Cargar juego"

        }

        ButtonDefault {
            id:cargaPreferencias
            width: iniciar.width
            class_name: "balanced"
            text: "Preferencias"
        }

        ButtonDefault {
            id:cargaAyuda
            width: iniciar.width
            class_name: "balanced"
            text: "Ayuda"
        }
        ButtonDefault {
            id:cargaSalir
            class_name: "balanced"
            text: "Salir"
            width: iniciar.width

            MouseArea{
                anchors.fill: parent
                onClicked: {salirJuego.visible=true}
            }
        }

    }


}


    Salir{
        id:salirJuego
        visible: false
    }
}
