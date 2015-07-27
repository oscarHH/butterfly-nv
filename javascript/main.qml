import QtQuick 2.5
import QtQuick.Window 2.2
import QtMultimedia 5.4
import QtGraphicalEffects 1.0
import QtMultimedia 5.4

import FileIO 1.0
import "menu" as My



import "evaluarHistoria.js" as EvaluarHistoria
import "manejoCadena.js" as ManejoCadenas



Window {

    MediaPlayer{
        id:musica
    }


    //variables globales
    property int val: 0 //incrementa cada vez que se da un click
    property string positionx: ""
    id:root
    visible: true


    //minimumWidth:  890
    //minimumHeight: 665
    //maximumWidth: 800
    //maximumHeight: 600
    width: 890
    height:665

/*    Column {
        Ejemplo{width: 50; height:50 }
    }
*/


    /*My.MenuButerfly{
            anchors.fill: parent
            texto:"hola"
            colorfondo:"#695640"
    }*/


    /*Rectangle{
        height: parent.height
        width: parent.width
        color:"black"
    }*/

    /*Rectangle{
        width: parent.width; height: parent.height
        color:"black"

        Grid{
            id:rent
            x:0; y:0
            rows: 125; columns:75; spacing: 0
            Repeater { model: 3000
                Rectangle {
                    width: 30; height: 30
                    color:{
                        if(index%2 === 0){
                            console.log(rent.columns)
                           return "#c8c5c6"
                        }else{
                          return "#a2a2a2"
                        }
                    }
            }
        }*/






    //contenedor
    Rectangle {
        //visible: false
        ShaderEffect {
            anchors.fill: parent
            property real tileSize: 16
            property color color1: Qt.rgba(0.9, 0.9, 0.9, 1);
            property color color2: Qt.rgba(0.8, 0.8, 0.8, 1);

            property size pixelSize: Qt.size(width / tileSize, height / tileSize);

            fragmentShader:
                "
                uniform lowp vec4 color1;
                uniform lowp vec4 color2;
                uniform highp vec2 pixelSize;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    highp vec2 tc = sign(sin(3.14152 * qt_TexCoord0 * pixelSize));
                    if (tc.x != tc.y)
                        gl_FragColor = color1;
                    else
                        gl_FragColor = color2;
                }
                "
        }

        //   visible: false
        id: rect
        width: parent.width
        height: parent.height
        //imagen de fondo
        Image{
            id : imgFondo
            width: parent.width
            height: parent.height
            fillMode: Image.Stretch
            MouseArea {
                anchors.fill: parent
                onClicked: { runJS();}
            }
            //source:"file:///C:/Users/h2o/Desktop/renpy-6.99.4-sdk/the_question/game/uni.jpg"
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
            //source: ""

            //width: sourceSize.width
            //height:  parent.height
            //width:
            width: {(sourceSize.width *  parent.width) / 800}

            height: {(sourceSize.height *  parent.height) / 600}


            //fillMode: Image.PreserveAspectFit

            x:{
                switch(positionx){
                case "right":root.width - img2.width;break
                case "left": 0; break
                case "center":(parent.width - img2.width )/2; break
                default:  (parent.width - img2.width )/2; break
                }
            }
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
                property string nombre: ""
                id: textNombrePersonaje
                x: rectaux.height/20
                y: rectaux.height/20
                text: {nombre}
                font.family: "DejaVu Sans"
                font.bold: true
                styleColor: "#29bea5"
                style: Text.Sunken
                font.pixelSize: parent.width/35
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
                //"esto es un ejemplo ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssb a b c"
                property var cadenaMostrar: {""}
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
        title = EvaluarHistoria.nombrenovela()
        runJS();
    }


    //funcion de la historia
    function runJS() {
        var totalHistorias = EvaluarHistoria.totalContenido()
        console.log(totalHistorias)
        //console.log("var a: " + val);
        if(val < totalHistorias){
            var instrucciones = EvaluarHistoria.contenido(val)
            switch(EvaluarHistoria.tipoDato(val)){
            case "Label":
                val++
                runJS()
                val--
                break
            case "Personaje":
                textNombrePersonaje.visible=true
                textNombrePersonaje.color = instrucciones.Color
                textNombrePersonaje.text = instrucciones.Personaje
                textDial.text = instrucciones.Texto
                break
            case "Narrador":
                textNombrePersonaje.visible=false
                textDial.text = instrucciones.Narrador
                break
            case "Fondo":
                imgFondo.source = Direccion+instrucciones.Ruta
                val++
                runJS()
                val--
                break
            case "ImagenPersonaje":
                img2.visible=true;
                img2.source = Direccion+instrucciones.Ruta

                //#right left center
                switch(instrucciones.Posicion){
                case "right":positionx="right"; break
                case "left": positionx="left";    break
                case "center": positionx="center"; break
                default:positionx=""; break
                }
                val++
                runJS()
                val--

                break

            case "OcultarPersonaje":
                img2.visible=false;
                val++
                runJS()
                val--
                break
            case "Musica":
                musica.autoPlay=true
                if(instrucciones.Infinito === true){
                    musica.loops=Audio.Infinite
                }else{
                    musica.loops=0
                }
                musica.source=Direccion+instrucciones.Ruta

                val++
                runJS()
                val--

                break
            case "DetenerMusica":
                musica.stop()
                val++
                runJS()
                val--
                break
            case "Sonido":
                musica.play()

                musica.loops=0
                musica.source= Direccion +instrucciones.Ruta
                break
            case "Menu":
                var tamanio = instrucciones.Contenido.length
                console.log(tamanio)
                break
            default:
                break
            }
            val++
        }
    }
}

