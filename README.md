# La Parrilla de Rosendo
Rosendo tiene una parrilla y nos pidió un sistema para administrar su menú.

## 1. Comidas
Nos piden modelar los distintos platos que ofrece la parrilla. De cada **Plato** nos interesa conocer:
* su **peso**, medido en gramos;
* si es **apto vegetariano**;
* su **valoración**, un número que indica qué tan bueno es el plato;
* si **es abundante**, lo cual es cierto cuando su peso es mayor a 250 gramos.

Consideraremos inicialmente estos platos:

### Provoleta
Cada provoleta tiene un peso diferente y pueden tener o no especias. Las provoletas son _apto vegetariano_ si no tiene especias.
También decimos que una provoleta **es especial** cuando se cumple alguna de estas condiciones:
* _es abundante_ 
* ó _tiene especias_;

Su _valoración_ es de 120 puntos si es especial, y de 80 en caso contrario. 

### Hamburguesas de carne
Su _peso_ es siempre de 250 gramos y lógicamente no son _apto para vegetariano_. 
A cada hamburguesa se le configura su pan, y la _valoración_ del plato se calcula como `60 + valoración del pan`. 

Los tres únicos panes posibles en nuestro modelo son:
* **industrial** otorga 0 puntos;
* **casero** otorga 20 puntos;
* **de masa madre** otorga 45 puntos.

### Hamburguesas vegetarianas
Se comportan igual que las hamburguesas de carne, con tres diferencias:
* son _apto para vegetarianos_;
* para cada hamburguesa, se informa mediante un string de qué legumbre está hecha (por ejemplo: `"lentejas"` o `"garbanzos"`);
* a la valoración se le suma otro plus que, como valor máximo, puede ser _**17**_, y se calcula como `2 * cantidad de letras del nombre de la legumbre`. Por ejemplo, si es de lentejas (que tiene 8 letras) el plus será de 16, pero si fuera garbanzos (que tiene 9 letras) será 17 (el máximo permitido). 

**Tip:** para sacar la cantidad de letras de una palabra podes utilizar el mensaje `size()` a un string. 
### Parrillada
Para cada parrillada se nos indica los cortes de carne pedidos. De cada corte se conoce su nombre, _calidad_ (un número) y su _peso_.

El _peso_ de la parrillada es la suma de los pesos de sus cortes. No es _apto vegetariano_. La _valoración_ se calcula como `15 * máxima calidad de sus cortes - cantidad de cortes`, y no puede dar un resultado negativo.

Por ejemplo, si una parillada incluye los tres siguientes cortes
* asado, de calidad 2 y peso 800 gramos,
* vacio, de calidad 3 y peso 1200 gramos,
* matambre de cerdo, de calidad 1 y peso 1350 gramos,

El peso de la parrillada sería de **3350 gramos** y la valoracion sería de (15 * 3) - 3 = **42**


## 2. Comensales
Ya tenemos la comida, ahora nos faltan los comensales. :fork_and_knife:

De cada comensal nos interesa saber: 
* su **peso**, medido en gramos;
* si **le agrada o no una comida**, lo cual dependerá de tipo de comensal. Implementar el método `leAgrada(unaComida)` a cada tipo de comensal.
* las **comidas que comió**, una lista de todo lo que haya ingerido. Implementar un método `comer(unaComida)` que la agregue a la lista;
* y, si está **satisfecho o no**, lo cual explicaremos a continuación.

Para que un comensal esté satisfecho, se tiene que cumplir que el peso de las comidas ingeridas sea mayor o igual al 1% de su propio peso _y además_ una condición que define cada comensal (para que quede claro: se tienen que cumplir _ambas_ condiciones).    

Consideraremos los siguientes tipos de comensales:

### Vegetarianos
Les agradan las comidas que son apto vegetariano y tienen una valoración mayor a 85. La condición adicional para estar satisfechos es que ninguna comida de las ingeridas sea abundante.

### Hambre popular
Simplemente les agradan las comidas abundantes. No tienen ninguna condición adicional para estar satisfechos.

### De paladar fino
Les agradan las comidas que pesan entre 150 y 300 gramos, y además tienen una valoración mayor a 100. La condición adicional para satisfacerse es que la cantidad de comidas ingeridas sea par. 

## 3. Cocina
Agregar al modelo la cocina, que tiene _todas las comidas_ que la parrilla tiene preparadas. 

Se quiere poder consultar:
* si **tiene buena oferta vegetariana**: esto es así si la diferencia entre comidas vegetarianas y no vegetarianas es de a lo sumo 2. Por ejemplo: si hay 10 carnívoras y 8 vegetarianas sí tiene buena oferta, pero si hay 11 carnívoras no (porque la diferencia es mayor a 2). Otro ejemplo, si hay 11 vegetarianas y 9 carnívoras, tiene buena oferta vegetariana.
* **el plato fuerte carnívoro**: el de máxima valoración entre los no apto vegetariano;
* dado un comensal, la lista de **comidas que le gustan**.

## Bonus 
También se pide **poder elegir un plato**  para un comensal - por ahora es cualquier plato que le guste (buscar que método de las colecciones me devuelve un objeto al azar) -. Si no le gusta ningún plato, lanzar un error. Si el plato existe, sacarlo de la cocina y hacer que el comensal lo coma.

## 4. Test
Realizar al menos los siguientes tests.
### 4.1 Comidas
* Valoración de la Hambruguesa de Carne con pan casero. El resultado será: **80** (60 + 20)
* Valoración de la Hambruguesa Vegetariana, con pan de masaMadre y de garbanzos como legumbre. El resultado será: **122** (60 + 45 + 17)
* Provoleta, de peso 190 y con especias. El resultado de ser especial es: **true**
* Parillada, que incluya un asado, de calidad 10 y peso 250 gramos, una entraña, de calidad 7 y peso 200 gramos y un chorizo, de calidad 8 y peso 50 gramos. El resultado de la valoracion será de **147** (15 * 10) - 3.

### 4.2 Comensales
* Un vegetariano de peso 68500 gramos come una provoleta de 190 gramos con especias y dos Hamburguesas Vegetarianas (250 grs cada una) con pan de masaMadre y de garbanzos como legumbre. El resultado si esta satisfecho es: **True** porque (190 + 250 + 250) >= (68500 * 0.01) y además ninguna de las tres comidas es abundante, es decir, ninguna supera los 250 gramos.
* Un comensal popular de peso 85000 gramos come una parrillada que incluye un asado, de calidad 10 y peso 250 gramos, una entraña, de calidad 7 y peso 200 gramos y un chorizo, de calidad 8 y peso 50 gramos. El resultado si esta satisfecho es: **False** porque  500 < 850
* Un comensal de paladar fino le agrada comer una Hamburguesa de carne de 250 gramos con pan de masa madre.
* Un comensal de paladar fino NO agrada comer una Hamburguesa de carne de 250 gramos con pan casero.
