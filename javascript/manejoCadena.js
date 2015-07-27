//agrega un salto de linea a la cadena
function calculaCadena( name ) {
    var a = name.split(" ");
    var i=0;
    var aux=0 ;
    var cadenaFinal="";
    if (name.length > 100){
        for(i = 0; i < a.length ; i++){
            aux += a[i].length
            if(aux < 100){
                cadenaFinal += a[i] +" ";
            }else{
                aux=a[i].length;
                cadenaFinal +="\n" + a[i] + " ";
            }
        }
    }else{
        return name;
    }
    return cadenaFinal
}

