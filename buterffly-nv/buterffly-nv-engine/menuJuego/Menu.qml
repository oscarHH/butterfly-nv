import QtQuick 2.5

Rectangle{
    id: contenedorMenu
    width: parent.width
    height: parent.height
    color: "transparent"
    property string nombreLabel: ""


    ListModel {
        id: nameModel
    }

    /*Column{
        spacing: 5
        Repeater {
            model: nameModel

            Rectangle {
                width: 200
                height: 32
                //color: "transparent"
                visible: true
                Text {
                    text: name
                    font.pixelSize: 24
                }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {console.log(indice)}
                    }
            }
        }
    }*/


    Component {
        id: nameDelegate

        Rectangle{
            id:retn
            width: root.width-200
            height: tam
            color : "#f5b01b"
            radius: 15
            Text {

                text: name
                font.pixelSize: 24

            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    buscarLabel(label)
                    rect.enabled=true
                    menucasos.visible=false
                    console.log(label)
                }
                onEntered:  {retn.color="green"}
                onExited: {retn.color="#f5b01b"}

            }
        }
    }


    ListView {
        id: lista
        visible: true
        clip: true
        model: nameModel
        delegate: nameDelegate
        width: contenedorMenu.width -200
        height: contenedorMenu.height/4
        anchors.horizontalCenter: contenedorMenu.horizontalCenter
        anchors.verticalCenter: contenedorMenu.verticalCenter
        spacing: 10
    }



    function agregarItemMenu(textoItem){
        nameModel.append(textoItem)

    }

    function  limpiarItemMenu(){
        nameModel.clear()
    }


}
