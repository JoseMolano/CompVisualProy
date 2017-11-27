# Rasterization

En este proyecto se muestra la implementación de los pasos en el proceso de [rasterización](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage). En el repositorio se pueden encontrar tres sketch de Processing en donde se puede interactuar y así entender mejor los pasos. Los sketch son:

1. Pineda.
2. Overlap.
3. Barycentric coordinates.
4. Putting things together.

##Pineda

En este sketch se muestra la implementación del algoritmo desarrollado por **Juan Pineda** en 1988 y presentado en el documento **"A parallel Algorithm for Polygon Rasterization"**. Allí, pineda mostró la manera de encontrar si un pixel se superpone o está dentro de uno de los triángulos en el proceso.

Al iniciar se mostrara el triángulo de prueba y en la esquina superior izquierda el pixel. El sketch permite que se modifiquen las posiciiones de los vertices del triángulo dando clic a los botones izquierdo, derecho y central del mouse. Para mover el pixel y hacer pruebas será necesario cualquier tecla y el pixel se desplazará al lugar en donde se encuetre en puntero del mouse.

Al cambiar de lugar, el pixel cambiará de color según sea el resultado del algoritmo de Pineda con el triángulo. 

![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Pineda1.png "Título Opcional")
![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Pineda2.png "Título Opcional")

##Overlap

Para este sketch se hace una muestra de lo que genera el proceso de rasterización, dibujando un triángulo y mostrando según el algoritmo de **Pineda** cuales pixeles se encuentran dentro de el.

Para interactuar solo basta con mover los vertices del triángulo, al igual que en el sketch anterior, haciendo clic en los tres botones del mouse los vertices cambiarán de posición y los pixeles que cumplan las condiciones serán los que quedarán con distinto color.

En la primera linea del código es posible modificar la cantidad se pixeles a mostrar según se quiera probar, basta con modificar la variable _squares_ por el valor que se desee de columnas y el programa asumirá el mismo número para las filas.

`int squares = 23;`


![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Raster1.png "Título Opcional")
![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/raster2.png "Título Opcional")

##Barycentric coordinates

En esta implementación se empleo la teoría de las coordenadas barícentricas para calcular el valor que tiene un pixel dentro de un triángulo según los atributos que represente cada vertice del mismo.

A medida que se mueve el cursor por dentro del triángulo se puede ver como varían lo triángulos internos y el valor de las coordenadas baricéntricas ubicadas en parte superior izquierda, ademas también es posible modificar el triángulo para observar de distintas maneras las coordenadas, esto de la misma manera que en los anteriores, con los tres botones disponibles en el mouse.

![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Barycentric1.png "Título Opcional")
![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/barycentric2.png "Título Opcional")

Es importante tener en cuenta que todos los sketch parten de la idea del algoritmo de **Juan Pineda** para encontrar si un pixel se encuentra dentro de un triángulo, implementada en la función `insideTriangle` que recibe los valores _x_ y _y_ de los puntos en donde se encuentran los vertices y los valores _x_ y _y_ del punto a evaluar. 

##Putting things together

Para terminar, este sketch presenta la unión de todos los conceptos, la verificación pixel por pixel y la validación de su valor con respecto a las coordenadas baricéntricas de acuerdo a los valores asignados a los vertices del triángulo.

Al igual que las anteriores implementaciones, en esta ocasión podremos modificar el tamaño del triángulo con los botones del mouse y la cantidad de pixeles a mostrar, pero en esta ocasión podemos modificar los valores asignados a los vertices del triángulo para realizar la interpolación.

```
int squares = 50;
int vertexR = 255;
int vertexG = 255;
int vertexB = 255;
```

![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Together1.png "Título Opcional")
![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Together2.png "Título Opcional")
![Texto Alternativo](/Users/Jose/Desktop/Proyecto_final_computación_visual/imagenes/Together3.png "Título Opcional")

