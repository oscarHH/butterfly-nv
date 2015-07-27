import QtQuick 2.4
import QtMultimedia 5.4
import QtGraphicalEffects 1.0
import FileIO 1.0

import "evaluarHistoria.js" as EvaluarHistoria
import "manejoCadena.js" as ManejoCadenas



Item {
    //variables globales
    property int val: 0 //incrementa cada vez que se da un click
    id:root
    visible: true

    //minimumWidth:  890
    //minimumHeight: 665
    //maximumWidth: 800
    //maximumHeight: 600
    width: 890
    height:665

//contenedor
    Rectangle {
        id: rect
        width: parent.width
        height: parent.height
        //imagen de fondo
        Image{
            id : img
            width: parent.width
            height: parent.height
            fillMode: Image.Stretch
            MouseArea {
                anchors.fill: parent

                onClicked: { runJS();}
            }
            source:"file:///C:/Users/h2o/Desktop/renpy-6.99.4-sdk/the_question/game/uni.jpg"
        }

        Text {

            id: ren
            objectName:"ren"
            text: {ejemplo}
        }

        /*Text {
            id: te
            anchors.centerIn: parent
            //text: Evaluador.evaluarjs( file.read("guardar.json") );
        }*/

        FileIO {
            id: file
            // Component.onCompleted: file.setSource('guardar.json');
            //Component.onCompleted: Evaluador.evaluarjs( file.read("guardar.json") );
        }



        //imagen del personaje
        Image{
            id: img2
            source: "file:///C:/Users/h2o/Desktop/renpy-6.99.4-sdk/the_question/game/sylvie_normal.png"

            //width: sourceSize.width
            //height:  parent.height
            //width:
            width: {(sourceSize.width *  parent.width) / 800}

            height: {(sourceSize.height *  parent.height) / 600}


            //fillMode: Image.PreserveAspectFit

            x:root.width/3
            y:parent.height - img2.height
            //anchors.top: parent.top
            //anchors.bottom: parent.bottom
            //anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            visible: true
        }



        //video
        Video{
            id:video
            width:400
            height:300
            x: parent.width-400
            y: 0

            source: "file:///D:/Videos/__Until_The_End__(bajaryoutube.com).mp4"
            autoPlay: false
            fillMode: VideoOutput.Stretch
            smooth: true
            visible: false
            MouseArea {
                anchors.fill: parent
                //onClicked: { video.pause() }
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: {
                    if (mouse.button == Qt.RightButton)
                        video.play();
                    else
                        video.pause();
                }
            }
            //animacion del video
            PropertyAnimation on x{
                easing.type: Easing.InOutQuad
                from:0
                to: root.width-400
                duration:2000
            }
        }
        //contenedor de dialogos
        Rectangle{
            id: rectaux
            color: "black"
            x: 0
            y: parent.height - root.height/4
            width: root.width
            height: root.height/4
            opacity: 0.8

            //nombre del personaje
            Text{
                property string nombre: "Eileen"
                id: textNombrePersonaje
                x: rectaux.height/20
                y: rectaux.height/20
                text: {nombre}
                font.family: "DejaVu Sans"
                font.bold: true
                style: Text.Sunken
                font.pixelSize: parent.width/35
                color:"#c8ffc8"
                visible: true
            }

            //comentario del personaje
            Text{
                id: textDial
                x:rectaux.height/20
                y:{
                    if(textNombrePersonaje.visible){
                        textNombrePersonaje.height+15
                    }else{
                        rectaux.height/20
                    }
                }

                property var cadenaMostrar: {ManejoCadenas.calculaCadena("esto es un ejemplo ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssb a b c")}
                text:{cadenaMostrar}

                    //107
                font.family: "DejaVu Sans"
                font.bold: true
                style: Text.Sunken
                font.pixelSize: parent.width/35
                //height: {(sourceSize.height *  parent.height) / 600}
                color:"white"

            }
        }

    }

    /**
  Funciones para el progrma
*/
    //carga las funciones
    Component.onCompleted: {
        //Evaluador.evaluarjs( file.read("guardar.json") );
        EvaluarHistoria.tipo(file.read("historia.json"));
        //title = EvaluarHistoria.nombrenovela()
        runJS();
    }


    //funcion de la historia
    function runJS() {
        console.log(ejemplo)
        var totalHistorias = EvaluarHistoria.totalContenido()
        //console.log("var a: " + val);
        if(val < totalHistorias){
            var instrucciones = EvaluarHistoria.contenido(val)
            switch(EvaluarHistoria.tipoDato(val)){
            case "Personaje":
                textNombrePersonaje.visible=true
                textNombrePersonaje.text = instrucciones.Personaje
                textDial.text = instrucciones.Texto
                break
            case "Narrador":
                textNombrePersonaje.visible=false
                textDial.text = instrucciones.Narrador
                break
            default:
                break
            }
            val++
        }
    }
}
