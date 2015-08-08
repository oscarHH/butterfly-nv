//.import QtQuick 2.5 as Quick
//importa otro js
//Qt.include("factorial.js")

//Autor: Oscar Hernandez Hernandez
//Año: 2015
var contenidoJson; //almacena json (Historia.json)
var infoLabel =  new Object() //almacena todos los labels
var labelsH //total de labels en la historia
			  
//lee y parsea a json
function tipo(contenido){    
    contenidoJson= eval("{"+ contenido +"}");
}

//retorna: nombre de la novela
function nombrenovela(){
	if (contenidoJson.Titulo === undefined) {
		return "Buterfly-nv"
	}else{
		return contenidoJson.Titulo
	}
}

//retorna: el total de bloques en la historia
function totalContenido(){
    return contenidoJson.Historia.length;
}


//parametro (Index): posicion del elemento
//retorna:   "Tipo" del json
function tipoDato(index){
    return contenidoJson.Historia[index].Tipo;
}

//parametro (Index): posicion del elemento
//retorna: Elementos del json "Historia"
function contenido(index){
    return contenidoJson.Historia[index]
}


/*******************************************************************
*         		Manejo de labels
********************************************************************/
//busca y almacena la posicion donde se encuentra cada label
function analizarLabels(){	
		
		//var arrayPrueba = [];
		var totalLabels  = 0
		labelsH = 0
		for(totalLabels;totalLabels < totalContenido();totalLabels++ ){
			if(tipoDato(totalLabels)  === "Label" ){
				infoLabel[contenido(totalLabels).Label] = [totalLabels,contenido(totalLabels).Ruta]
				labelsH++
			}
		}
}

//retorna el tamaño  del objecto de labels
function tamaniLabels(){
	return labelsH
}

//retorna las propiedades del label buscado
//[posicison,Ruta del archivo"]
function buscarLabel(nombreLabel){	
	if(infoLabel[nombreLabel] === undefined){
		return "No existe el label" + nombreLabel
	}else{
		return infoLabel[nombreLabel]
	}
}
