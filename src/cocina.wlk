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
	method comidasQueLeGustan(comensal){return comensal.comidasComidas().filter{c=>comensal.leAgrada(c)}}
	method elegirPlato(comensal){
		if(self.todasLasComidas().isEmpty()){self.error("No hay comidas")}
		else{var com = self.comidasQueLeGustan(comensal).anyOne()
			 self.todasLasComidas().remove(com)
			 comensal.comer(com)}
	}
}