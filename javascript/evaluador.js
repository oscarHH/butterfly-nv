var contenidoJson;

function evaluarjs(contenido){ 
    console.log(contenido);
    contenidoJson= eval("{"+ contenido +"}");
    return contenidoJson.Titulo;
}


function imagen(value){
    return contenidoJson.Imagenes[value].Ruta;
}

function imagen2(value){
    return contenidoJson.Imagenes[value].Ruta;
}

function titulo(){
    return contenidoJson.Titulo;
}

function  totalImagenes(){
    return contenidoJson.Imagenes.length;
}
