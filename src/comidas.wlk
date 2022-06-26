/*
1) La mejor opción para manejar el peso en las comidas era la siguiente
. método abstracto peso en Plato
. const property peso en Provoleta
2) En ```esVegetariano()```} de Provoleta te falto la negación. "Las provoletas son _apto vegetariano_ si no tiene especias."
3) Los panes debían ser 3 objetos y a la hamburguesa debías configurar el pan y preguntarle a cada pan su puntuación
override method valoracion(){return 60 + pan.puntos()}. Revisa el código que te deje 
*/

class Plato {
	method peso()
	method valoracion()
	method esAbundante(){return self.peso() >250}	
	method esVegetariano()
}

class Provoleta inherits Plato{
	const property tieneEspecias
	const property peso
	override method valoracion(){
		if(self.esEspecial()){return 120}
		else{return 80}
	}
	override method esVegetariano(){return not tieneEspecias}
	method esEspecial(){return self.esAbundante() or tieneEspecias}	
}


class HamburguesasDeCarne inherits Plato{
	const property pan
	
	override method peso(){return 250}
	override method esVegetariano(){return false}
	override method valoracion(){return 60 + pan.puntos()}
	
}

object panIndustrial{
	method puntos()= 0
}

object panCasero{
	method puntos()= 20
}

object panDeMasa{
	method puntos()= 45
}


class HamburguesasVegetarianas inherits HamburguesasDeCarne{
	const legumbre 
	
	override method esVegetariano(){return true}
	override method valoracion(){return super() + self.plus()}
	method plus(){return 17.min(2*self.cantDeLetras())}
	method cantDeLetras(){return legumbre.size()}
}

class Parrillada inherits Plato{
	var property cortes=[]
	
	method agregarCorte(unCorte){self.cortes().add(unCorte)}
	override method esVegetariano(){return false}
	override method peso(){return self.cortes().sum{c=>c.peso()}}
	override method valoracion(){return 0.max((15*self.corteConMasCalidad().calidad())-self.cantDeCortes())}
	method corteConMasCalidad(){return self.cortes().max{c=>c.calidad()}}
	method cantDeCortes(){return cortes.size()}
}


class Cortes{
	const property nombre
	const property peso
	const property calidad
}




