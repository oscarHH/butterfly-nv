# [__Documentacion__] buterffly-nv
***
#Agregar un __Titulo__ a la novela
__Ejemplo:__
```json
 "Titulo": "Clon de renpy :3"
```


Titulo de la novela visual
***

#Agregar un nuevo __Label__.

> ####propiedades
> * __Label__  
      nombre que se asigna al label  
      
> * __Ruta__  
      si el label esta en otro archivo
      se debe indicar la ruta

`nota:` aun no se implementa la letura desde otro
archivo externo

__Ejemplo:__ Nuevo Label

```json
{
  "Tipo" : "Label",
  "Label" : "star",
  "Ruta" :""
}
```
***
#Agregar nueva __Musica__.
> ####propiedades
>* __Ruta__  
      Ubicacion de la musica

>* __Infinito__  
      indica si la musica se repite indefinidamente  
      (true | false)
      

__Ejemplo:__ Nueva Musica

```json
{
	"Tipo" : "Musica",
	"Ruta" : "/historia/ejemplo.mp3",
	"Infinito" : true
}
```
***
#Agregar Nuevo __Fondo__
> ####propiedades
> * __Ruta__  
Ubicacion del la imagen de fondo

> * __Nombre__  
asigna el nombre del fondo (opcional)

__Ejemplo:__ Nuevo Fondo

```json
{
	"Tipo" : "Fondo",
	"Ruta" : "/historia/lecturehall.jpg",
	"Nombre" : "bg"
}
```
***
#Agregar nueva __Narracion__

> ####Propiedades:
* __Narrador:__  
    indica la narracon a mostrar 

__Ejemplo:__ Nueva Narracion
```json    
{
	"Tipo" : "Narrador",
	"Narrador" : "When we came out of the university, I saw her."
}
```
***
#Agregar __imagen del Personaje__

> ####Propiedades
>* __Ruta:__  
    indica la ruta de la imagen
    
>* __Posicion:__  
 indica la ubicacion donde se mostrara la imagen ( "right" | "left" | "center"| "" ) si  no se indica la posicion se pondra centrada
 

__Ejemplo:__ Nueva imagen de personaje
```json    
{
	"Tipo" : "ImagenPersonaje",
	"Ruta" : "/historia/sylvie_normal.png",
	"Posicion" : ""
}
```
***

#Agregar __dialogo del Personaje__
> ####Propiedades
> * __Personaje:__  
 Nombre del personaje a mostrar
> * __Color:__  
indica el color del nombre del personaje
> * __Texto:__  
Dialogo del personaje


__Ejemplo:__  Nuevo dialogo del personaje
```json
{
	"Tipo" : "Personaje",
	"Personaje" : "uzumi",
	"Color" : "#c8ffc8",
	"Texto" : "Hola soy uzumi 01"
}
``` 
***
#Oculta imagen del personaje
> ####Propiedades
> * sin propiedades

__Ejemplo:__ Ocultar la image actual


```json
{
	"Tipo" : "OcultarPersonaje"
}
```

***
# Detener musica
> ####Propiedades
> * sin propiedades

__Ejemplo:__ Deter musica
```json
{
	"Tipo" : "DetenerMusica"
}
```
***
#Agrega nuevo sonido
`solo se reproduce una vez`
> ####Propiedades
> * __Ruta:__  
    indica la ruta del sonido

__Ejemplo:__ Nuevo sonido
```json
{
	"Tipo" : "Sonido",
	"Ruta" : "/historia/ejemplo.mp3",
}
```
***
#Saltar
`salta hasta el label indicado`

> ####Propiedades
> * __Saltar:__  
   Indica el nombre del label a donde saltar

__Ejemplo:__  Saltar hasta el label segundo

```json
{
			"Tipo":"Saltar",
			"Saltar":"segundo"
}
```
***
#Nuevo menu
`No implementado`
> ####Propiedades
> * __Contenido:__  
> 
> > * __Texto:__  
    Texto que indica una opcion del menu
    
> > * __Saltar:__    
    indica en que label debe saltar

__Ejemplo:__ Menu con dos opciones.  

```json

{
		"Tipo" : "Menu",
		"Contenido" : [
			{
				"Texto" : "... to ask her right away.",
				"Saltar" : "rightaway"
			},
			{
				"Texto" : "... to ask her right away.",
				"Saltar" : "rightaway"
			}
    	]
}

```


