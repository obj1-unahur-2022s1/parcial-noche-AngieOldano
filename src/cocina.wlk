/*
En ```tieneBuenaOfertaVegetariana()``` tenias usar el valor absoluto abs() sobre la diferencia
En ```comidasQueLeGustan``` tenias que recorrer las comidas de la cocina y vos recorristes las comidas que comio
En ```elegirPlato() tambien te confundiste sobre la coleccion que debías recorrer.
 */
import comidas.*
import comensales.*

object cocina{
	var property todasLasComidas=[]
	
	method agregarComida(comida){self.todasLasComidas().add(comida)}
	method buenaOfertaVeg(){return (self.cantComidasVeg()-self.cantComidasNoVeg())>2}
	method cantComidasVeg(){return self.todasLasComidas().filter{c=>c.esVegetariano()}.size()}
	method cantComidasNoVeg(){return self.comidasCarnivoras().size()}
	method comidasCarnivoras(){return self.todasLasComidas().filter{c=>!c.esVegetariano()}}
	method platoFuerteCar(){return self.comidasCarnivoras().max{c=>c.valoracion()}}
	method comidasQueLeGustan(comensal){return todasLasComidas.filter{c=>comensal.leAgrada(c)}}
	method elegirPlato(comensal){
		if(self.comidasQueLeGustan(comensal).isEmpty())
			self.error("No hay comidas")
		const com = self.comidasQueLeGustan(comensal).anyOne()
			 todasLasComidas.remove(com)
			 comensal.comer(com)
	}
}