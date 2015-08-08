import QtQuick 2.5
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtMultimedia 5.4
import QtQuick.Layouts 1.2

import FileIO 1.0

import "JS/evaluarHistoria.js" as EvaluarHistoria
import "JS/manejoCadena.js" as ManejoCadenas
import "menuPrincipal"
import "menuJuego"


Window {
    property int val: 0 //incrementa cada vez que se da un click
    property string positionx: ""

    id:root
    visible: true
    width: 890
    height:665


    //reproductor de audio
    MediaPlayer{
        id:musica
    }

    //menu del juego
    Rin{
        id:menuLen
        visible: true
    }

    //contenedor del juego
    Rectangle {
        id: rect
        visible:false
        focus: true
        width: parent.width
        height: parent.height

        //deteccion de teclas
        Keys.onPressed: {
            if ((event.key === Qt.Key_Escape) ){
                menusalir.visible=true
            }
        }

        //cuadricula
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
            width: {(sourceSize.width *  parent.width) / 800}
            height: {(sourceSize.height *  parent.height) / 600}

            x:{
                switch(positionx){
                case "right":root.width - img2.width;break
                case "left": 0; break
                case "center":(parent.width - img2.width )/2; break
                default:  (parent.width - img2.width )/2; break
                }
            }
            y:parent.height - img2.height
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
            /*PropertyAnimation on x{
                easing.type: Easing.InOutQuad
                from:0
                to: root.width-400
                duration:2000
            }*/
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
                property var cadenaMostrar: {""}
                text:{cadenaMostrar}

                //107
                font.family: "DejaVu Sans"
                font.bold: true
                style: Text.Sunken
                font.pixelSize: parent.width/35
                color:"white"
            }
        }
    }


    Menu{
        id:menucasos
        visible:false
    }

    Salir{
        id:menusalir
        visible:false
    }



    //leer desde otro documento
    function createItem() {

        //var remplaza = Direccion
        //var rem =remplaza.replace("file:///","")
        //var an = Qt.createQmlObject(file.read(rem+"/buterffly-nv-engine/Len.qml"), root, "reb");
    }



    //carga las funciones
    Component.onCompleted: {
        //createItem()
        EvaluarHistoria.tipo(file.read("Historia/historia.json"));
        title = EvaluarHistoria.nombrenovela()
        console.log(EvaluarHistoria.analizarLabels())
        //runJS();
    }

    //property int respaldo: 0
    //funcion de la historia
    function runJS() {
        var totalHistorias = EvaluarHistoria.totalContenido()
        //console.log(totalHistorias)
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
                textDial.text = ManejoCadenas.calculaCadena(instrucciones.Narrador)
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
                rectaux.visible=false

                for(var i=0; i<tamanio; i++){
                    console.log(instrucciones.Contenido[i].Texto)
                    menucasos.agregarItemMenu({ name: instrucciones.Contenido[i].Texto, label:instrucciones.Contenido[i].Saltar, tam:35})

                }

                rect.enabled=false
                menucasos.visible=true


                break

            case "Fin":
                val = 0
                rect.visible=false
                img2.visible=false
                menuLen.visible=true
                break

            case "Saltar":
               buscarLabel(instrucciones.Saltar)
                break

            default:
                break

            }
            val++
        }
    }

    function buscarLabel(busca){
        var posicionNovela = EvaluarHistoria.buscarLabel(busca)
        val = posicionNovela[0]

        img2.visible=false; //oculta la imagen  del personaje
        menucasos.limpiarItemMenu() //limpia el contenido del menu
        rectaux.visible=true //se muestra el cuadro de dialogo

        runJS()

    }

}
