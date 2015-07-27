//importa otro js
//Qt.include("factorial.js")
var contenidoJson;

function tipo(contenido){
    contenidoJson= eval("{"+ contenido +"}");
}

function nombrenovela(){
    return contenidoJson.Titulo
}

function totalContenido(){
    //console.log(contenidoJson.Historia.length);
    return contenidoJson.Historia.length;
}

function tipoDato(index){
    return contenidoJson.Historia[index].Tipo;
}


function contenido(index){
    return contenidoJson.Historia[index]
}

