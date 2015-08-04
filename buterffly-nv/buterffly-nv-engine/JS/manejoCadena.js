//Autor: Oscar Hernandez Hernandez
//Año: 2015

//agrega un salto de linea a la cadena
function calculaCadena( name ) {
    var a = name.split(" ");
    var i=0;
    var aux=0 ;
    var cadenaFinal="";
    if (name.length > 60){
        for(i = 0; i < a.length ; i++){
            aux += a[i].length
            if(aux <= 50){
                cadenaFinal += a[i] +" ";
            }else{
                aux=a[i].length;
                cadenaFinal +="\n" + a[i] + " ";
            }
        }
        return cadenaFinal
    }else{
        return name;
    }
}
