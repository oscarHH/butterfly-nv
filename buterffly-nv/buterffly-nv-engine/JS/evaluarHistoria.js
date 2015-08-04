//.import QtQuick 2.5 as Quick
//importa otro js
//Qt.include("factorial.js")

//Autor: Oscar Hernandez Hernandez
//Año: 2015
var contenidoJson; //almacena json (Historia.json)
var infoLabel =  new Object() //almacena todos los labels
var labelsH //total de labels en la historia

//var arreglo = [ []] 

			  
//lee y parsea a json
function tipo(contenido){    
    contenidoJson= eval("{"+ contenido +"}");
}

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
		
		buscarLabel("segundoa")
		//for(indice;indice < totalContenido();indice++ ){
	//			arrayPrueba.push(2);
		//		arrayPrueba.push("nombre:ren");
			//	arrayPrueba.push("rut:c");
		//}
		/*arreglo.shift()
		arreglo.push (arrayPrueba);
		console.log("------------------------")
		console.log(arreglo[0][1])
		console.log(arrayPrueba.length)
		arrayPrueba = []
		console.info(arrayPrueba.length)
		console.log("------------------------")
		var ejemplo =  new Object()
		ejemplo["primero"] = [12,"rut 1"]
		ejemplo["segundo"] = [15,"ruta 2"]
		print (ejemplo["primero"][1])
		print (ejemplo["segundo"][1])
		print(ejemplo.ke)
		var as = "segundo"
		
		print(ejemplo[as])
		console.log("------------------------")*/
		return "asd"
}

//retorna el tamaño  del objecto de labels
function tamaniLabels(){
	return labelsH
}

//retorna las propiedades del label buscado
function buscarLabel(nombreLabel){	
	if(infoLabel[nombreLabel] === undefined){
		print ("No existe el label" + nombreLabel)
		return "No existe el label" + nombreLabel
	}else{
		print (infoLabel[nombreLabel])
		return infoLabel[nombreLabel]
	}
}

//retorna: nombre de la novela
function nombrenovela(){
	if (contenidoJson.Titulo === undefined) {
		return "Buterfly-nv"
	}else{
		return contenidoJson.Titulo
	}
}

//retorna: el total de bloques en historia
function totalContenido(){
    return contenidoJson.Historia.length;
}


//parametro (Index): posicion del elemento
//retorna: el tipo de dato de la etiqueta "Tipo" del json
function tipoDato(index){
    return contenidoJson.Historia[index].Tipo;
}

//parametro (Index): posicion del elemento
//retorna: Elementos del json "Historia"
function contenido(index){
    return contenidoJson.Historia[index]
}
